/*
 * quic_utils.c
 *
 * Some simple quic helper functions
 *
 * =========================================================================
 * Copyright (c) 2016-2019 Daniele De Sensi (d.desensi.software@gmail.com)
 * Copyright (c) 2020 SoftAtHome (david.cluytens@gmail.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * =========================================================================
 */

#include "quic_utils.h"
#include <peafowl/inspectors/inspectors.h>
#include <peafowl/peafowl.h>
#include <stdio.h>

uint16_t quic_getu16(const unsigned char *start, size_t offset) {
#if __BYTE_ORDER == __LITTLE_ENDIAN
  return get_u16((const char *) start, offset);
#elif __BYTE_ORDER == __BIG_ENDIAN
  uint16_t x = get_u16((const char *) start, offset);
  return x << 8 | x >> 8;
#else
#error "Please fix <bits/endian.h>"
#endif
}

uint32_t quic_getu32(const unsigned char *start, size_t offset) {
#if __BYTE_ORDER == __LITTLE_ENDIAN
  return get_u32((const char *) start, offset);
#elif __BYTE_ORDER == __BIG_ENDIAN
  uint32_t x = get_u32((const char *) start, offset);
  return ((((x) &0xff000000u) >> 24) | (((x) &0x00ff0000u) >> 8) | (((x) &0x0000ff00u) << 8) |
          (((x) &0x000000ffu) << 24));
#else
#error "Please fix <bits/endian.h>"
#endif
}

/**
 *  @brief QUIC variable length Integer decoding algorithm 
 */
size_t quic_get_variable_len(const unsigned char *app_data, size_t offset, uint64_t *var_len) {
  size_t mbit = app_data[offset] >> 6;
  size_t len = 0;

  switch (mbit) {
  case 0:
    len = 1;
    *var_len = (uint64_t)(app_data[offset] & 0x3F);
    break;
  case 1:
    *var_len = ((uint64_t)(app_data[offset] & 0x3F) << 8) + (uint64_t)(app_data[offset + 1] & 0xFF);
    len = 2;
    break;
  case 2:
    *var_len = ((uint64_t)(app_data[offset] & 0x3F) << 24) + ((uint64_t)(app_data[offset + 1] & 0xFF) << 16) +
               ((uint64_t)(app_data[offset + 2] & 0xFF) << 8) + (uint64_t)(app_data[offset + 3] & 0xFF);
    len = 4;
    break;
  case 3:
    *var_len = ((uint64_t)(app_data[offset] & 0x3F) << 56) + ((uint64_t)(app_data[offset + 1] & 0xFF) << 48) +
               ((uint64_t)(app_data[offset + 2] & 0xFF) << 40) + ((uint64_t)(app_data[offset + 3] & 0xFF) << 32) +
               ((uint64_t)(app_data[offset + 4] & 0xFF) << 24) + ((uint64_t)(app_data[offset + 5] & 0xFF) << 16) +
               ((uint64_t)(app_data[offset + 6] & 0xFF) << 8) + (uint64_t)(app_data[offset + 7] & 0xFF);
    len = 8;
    break;
  default:
    len = 0; /* error should not happen */
  }
  return len;
}

void phton64(uint8_t *p, uint64_t v) {
  p[0] = (uint8_t)(v >> 56);
  p[1] = (uint8_t)(v >> 48);
  p[2] = (uint8_t)(v >> 40);
  p[3] = (uint8_t)(v >> 32);
  p[4] = (uint8_t)(v >> 24);
  p[5] = (uint8_t)(v >> 16);
  p[6] = (uint8_t)(v >> 8);
  p[7] = (uint8_t)(v >> 0);
}

uint64_t pntoh64(const void *p) {
  return (uint64_t) * ((const uint8_t *) (p) + 0) << 56 | (uint64_t) * ((const uint8_t *) (p) + 1) << 48 |
         (uint64_t) * ((const uint8_t *) (p) + 2) << 40 | (uint64_t) * ((const uint8_t *) (p) + 3) << 32 |
         (uint64_t) * ((const uint8_t *) (p) + 4) << 24 | (uint64_t) * ((const uint8_t *) (p) + 5) << 16 |
         (uint64_t) * ((const uint8_t *) (p) + 6) << 8 | (uint64_t) * ((const uint8_t *) (p) + 7) << 0;
}

void debug_print_rawfield(const unsigned char *app_data, size_t start_offset, size_t len) {
  size_t i;

  for (i = 0; i < len; i++) {
    printf("%02X", app_data[start_offset + i]);
  }
  printf("\n");
}

/**
 * @brief Function to allocate memory and copy data to it. Similar to 'strdup' but for general memory.
 */
void *memdup(const uint8_t *orig, size_t len) {
  void *dest = malloc(len);
  if (dest)
    memcpy(dest, orig, len);
  return dest;
}

uint8_t quic_length_of_encoded_value(uint8_t value) {
  switch (value >> 6) {
  case 0:
    return 1;
  case 1:
    return 2;
  case 2:
    return 4;
  case 3:
    return 8;
  default: /* Not possible */
    return -1;
  }
}
