# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron

# Include any dependencies generated for this target.
include toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/depend.make

# Include the progress variables for this target.
include toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/progress.make

# Include the compile flags for this target's objects.
include toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/flags.make

toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.o: toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/flags.make
toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.o: toolboxes/pattern_recognition/pr_kmeans.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.o"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.o -c /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition/pr_kmeans.cpp

toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.i"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition/pr_kmeans.cpp > CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.i

toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.s"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition/pr_kmeans.cpp -o CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.s

# Object files for target gadgetron_toolbox_pr
gadgetron_toolbox_pr_OBJECTS = \
"CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.o"

# External object files for target gadgetron_toolbox_pr
gadgetron_toolbox_pr_EXTERNAL_OBJECTS =

toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/pr_kmeans.cpp.o
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/build.make
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/fft/cpu/libgadgetron_toolbox_cpufft.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/klt/cpu/libgadgetron_toolbox_cpuklt.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/image_io/libgadgetron_toolbox_image_analyze_io.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/dwt/cpu/libgadgetron_toolbox_cpudwt.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/image/cpu/libgadgetron_toolbox_cpu_image.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libfftw3f.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libfftw3.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/core/cpu/math/libgadgetron_toolbox_cpucore_math.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/core/cpu/libgadgetron_toolbox_cpucore.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /home/benoit/gadgetron_install_dir/gadgetron4_sms/local/lib/libismrmrd.so.1.4.2
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libpthread.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libsz.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libz.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libdl.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libm.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_system.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_timer.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libpython3.6m.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_python3.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/log/libgadgetron_toolbox_log.so.4.1.1
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/liblapacke.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: /usr/lib/x86_64-linux-gnu/libopenblas.so
toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1: toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libgadgetron_toolbox_pr.so"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gadgetron_toolbox_pr.dir/link.txt --verbose=$(VERBOSE)
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition && $(CMAKE_COMMAND) -E cmake_symlink_library libgadgetron_toolbox_pr.so.4.1.1 libgadgetron_toolbox_pr.so.4.1 libgadgetron_toolbox_pr.so

toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1: toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1
	@$(CMAKE_COMMAND) -E touch_nocreate toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1

toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so: toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so.4.1.1
	@$(CMAKE_COMMAND) -E touch_nocreate toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so

# Rule to build all files generated by this target.
toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/build: toolboxes/pattern_recognition/libgadgetron_toolbox_pr.so

.PHONY : toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/build

toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/clean:
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition && $(CMAKE_COMMAND) -P CMakeFiles/gadgetron_toolbox_pr.dir/cmake_clean.cmake
.PHONY : toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/clean

toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/depend:
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : toolboxes/pattern_recognition/CMakeFiles/gadgetron_toolbox_pr.dir/depend
