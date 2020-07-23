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
include gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/depend.make

# Include the progress variables for this target.
include gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/progress.make

# Include the compile flags for this target's objects.
include gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/flags.make

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.o: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/flags.make
gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.o: gadgets/thermo_core/ZeroFillingGadget.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.o"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.o -c /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGadget.cpp

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.i"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGadget.cpp > CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.i

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.s"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGadget.cpp -o CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.s

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.o: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/flags.make
gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.o: gadgets/thermo_core/ZeroFillingGPUGadget.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.o"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.o -c /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGPUGadget.cpp

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.i"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGPUGadget.cpp > CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.i

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.s"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGPUGadget.cpp -o CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.s

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.o: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/flags.make
gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.o: gadgets/thermo_core/ZeroFillingGPUPlusGadget.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.o"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.o -c /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGPUPlusGadget.cpp

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.i"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGPUPlusGadget.cpp > CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.i

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.s"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/ZeroFillingGPUPlusGadget.cpp -o CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.s

# Object files for target gadgetron_thermocore
gadgetron_thermocore_OBJECTS = \
"CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.o" \
"CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.o" \
"CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.o"

# External object files for target gadgetron_thermocore
gadgetron_thermocore_EXTERNAL_OBJECTS =

gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGadget.cpp.o
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUGadget.cpp.o
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/ZeroFillingGPUPlusGadget.cpp.o
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/build.make
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: gadgets/mri_core/libgadgetron_mricore.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/dwt/gpu/libgadgetron_toolbox_gpudwt.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/operators/gpu/libgadgetron_toolbox_gpuoperators.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/mri/pmri/gpu/libgadgetron_toolbox_gpuparallelmri.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: core/writers/libgadgetron_core_writers.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/denoise/libgadgetron_toolbox_denoise.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/core/cpu/hostutils/libgadgetron_toolbox_hostutils.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/operators/cpu/libgadgetron_toolbox_cpuoperator.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/registration/optical_flow/cpu/libgadgetron_toolbox_cpureg.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/dwt/cpu/libgadgetron_toolbox_cpudwt.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/python/libgadgetron_toolbox_python.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/mri_core/libgadgetron_toolbox_mri_core.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: core/libgadgetron_core.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/fft/cpu/libgadgetron_toolbox_cpufft.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libfftw3f.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libfftw3.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/image_io/libgadgetron_toolbox_image_analyze_io.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/klt/cpu/libgadgetron_toolbox_cpuklt.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/solvers/gpu/libgadgetron_toolbox_gpusolvers.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/core/cpu/math/libgadgetron_toolbox_cpucore_math.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/liblapacke.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libopenblas.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/nfft/gpu/libgadgetron_toolbox_gpunfft.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/fft/gpu/libgadgetron_toolbox_gpufft.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/core/gpu/libgadgetron_toolbox_gpucore.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/core/cpu/libgadgetron_toolbox_cpucore.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: toolboxes/log/libgadgetron_toolbox_log.so.4.1.1
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /home/benoit/gadgetron_install_dir/gadgetron4_sms/local/lib/libismrmrd.so.1.4.2
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libpthread.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libsz.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libz.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libdl.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libm.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_system.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_timer.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libpython3.6m.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/lib/x86_64-linux-gnu/libboost_python3.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/local/cuda-10.0/lib64/libcublas.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/local/cuda-10.0/lib64/libcusparse.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/local/cuda-10.0/lib64/libcudart.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: /usr/local/cuda-10.0/lib64/libcufft.so
gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1: gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libgadgetron_thermocore.so"
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gadgetron_thermocore.dir/link.txt --verbose=$(VERBOSE)
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && $(CMAKE_COMMAND) -E cmake_symlink_library libgadgetron_thermocore.so.4.1.1 libgadgetron_thermocore.so.4.1 libgadgetron_thermocore.so

gadgets/thermo_core/libgadgetron_thermocore.so.4.1: gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1
	@$(CMAKE_COMMAND) -E touch_nocreate gadgets/thermo_core/libgadgetron_thermocore.so.4.1

gadgets/thermo_core/libgadgetron_thermocore.so: gadgets/thermo_core/libgadgetron_thermocore.so.4.1.1
	@$(CMAKE_COMMAND) -E touch_nocreate gadgets/thermo_core/libgadgetron_thermocore.so

# Rule to build all files generated by this target.
gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/build: gadgets/thermo_core/libgadgetron_thermocore.so

.PHONY : gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/build

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/clean:
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core && $(CMAKE_COMMAND) -P CMakeFiles/gadgetron_thermocore.dir/cmake_clean.cmake
.PHONY : gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/clean

gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/depend:
	cd /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core /home/benoit/gadgetron_install_dir/gadgetron4_sms/mrprogs/gadgetron/gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : gadgets/thermo_core/CMakeFiles/gadgetron_thermocore.dir/depend
