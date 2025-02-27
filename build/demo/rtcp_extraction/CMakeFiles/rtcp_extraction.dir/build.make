# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/brecht/Downloads/peafowl-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/brecht/Downloads/peafowl-master/build

# Include any dependencies generated for this target.
include demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/compiler_depend.make

# Include the progress variables for this target.
include demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/progress.make

# Include the compile flags for this target's objects.
include demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/flags.make

demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o: demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/flags.make
demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o: /home/brecht/Downloads/peafowl-master/demo/rtcp_extraction/rtcp_extraction.c
demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o: demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brecht/Downloads/peafowl-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o"
	cd /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o -MF CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o.d -o CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o -c /home/brecht/Downloads/peafowl-master/demo/rtcp_extraction/rtcp_extraction.c

demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.i"
	cd /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/brecht/Downloads/peafowl-master/demo/rtcp_extraction/rtcp_extraction.c > CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.i

demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.s"
	cd /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/brecht/Downloads/peafowl-master/demo/rtcp_extraction/rtcp_extraction.c -o CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.s

# Object files for target rtcp_extraction
rtcp_extraction_OBJECTS = \
"CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o"

# External object files for target rtcp_extraction
rtcp_extraction_EXTERNAL_OBJECTS =

demo/rtcp_extraction/rtcp_extraction: demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/rtcp_extraction.c.o
demo/rtcp_extraction/rtcp_extraction: demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/build.make
demo/rtcp_extraction/rtcp_extraction: src/libpeafowl.so
demo/rtcp_extraction/rtcp_extraction: /usr/local/lib64/libssl.so
demo/rtcp_extraction/rtcp_extraction: /usr/local/lib64/libcrypto.so
demo/rtcp_extraction/rtcp_extraction: demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/brecht/Downloads/peafowl-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rtcp_extraction"
	cd /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rtcp_extraction.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/build: demo/rtcp_extraction/rtcp_extraction
.PHONY : demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/build

demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/clean:
	cd /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction && $(CMAKE_COMMAND) -P CMakeFiles/rtcp_extraction.dir/cmake_clean.cmake
.PHONY : demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/clean

demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/depend:
	cd /home/brecht/Downloads/peafowl-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/brecht/Downloads/peafowl-master /home/brecht/Downloads/peafowl-master/demo/rtcp_extraction /home/brecht/Downloads/peafowl-master/build /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction /home/brecht/Downloads/peafowl-master/build/demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demo/rtcp_extraction/CMakeFiles/rtcp_extraction.dir/depend

