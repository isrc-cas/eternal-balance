set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR Cortex-A53)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(CMAKE_C_COMPILER /home/pz/riscvws/toolchainbin/arm-gcc-linaro/armv8l/gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf/bin/armv8l-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER /home/pz/riscvws/toolchainbin/arm-gcc-linaro/armv8l/gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf/bin/armv8l-linux-gnueabihf-g++)

set(SYSROOTPATH /home/pz/riscvws/toolchainbin/arm-gcc-linaro/armv8l/sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf)

set(Cortex_A53_FLAGS "-O3 -Os -mcpu=cortex-a53 --sysroot=${SYSROOTPATH} -I${SYSROOTPATH}usr/include/")
set(CMAKE_C_FLAGS "${Cortex_A53_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${Cortex_A53_FLAGS}" CACHE STRING "" FORCE)
