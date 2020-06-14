set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR Cortex-m0)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(CMAKE_C_COMPILER /home/pz/riscvws/toolchainbin/arm-gcc-linaro/arm/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER /home/pz/riscvws/toolchainbin/arm-gcc-linaro/arm/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++)

set(SYSROOTPATH /home/pz/riscvws/toolchainbin/arm-gcc-linaro/arm/sysroot-glibc-linaro-2.25-2019.12-arm-linux-gnueabihf)

set(Cortex_M0_FLAGS "-O3 -marm --sysroot=${SYSROOTPATH} -I${SYSROOTPATH}usr/include/")
set(CMAKE_C_FLAGS "${Cortex_M0_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${Cortex_M0_FLAGS}" CACHE STRING "" FORCE)
