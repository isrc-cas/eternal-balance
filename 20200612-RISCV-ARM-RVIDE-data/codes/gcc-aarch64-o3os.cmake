set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR Cortex-A53)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(CMAKE_C_COMPILER /home/pz/riscvws/toolchainbin/arm-gcc-linaro/aarch64/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /home/pz/riscvws/toolchainbin/arm-gcc-linaro/aarch64/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-g++)

set(SYSROOTPATH /home/pz/riscvws/toolchainbin/arm-gcc-linaro/aarch64/sysroot-glibc-linaro-2.25-2019.12-aarch64-linux-gnu)

set(Cortex_A53_FLAGS "-Os -O3 -mcpu=cortex-a53 --sysroot=${SYSROOTPATH} -I${SYSROOTPATH}usr/include/")
set(CMAKE_C_FLAGS "${Cortex_A53_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${Cortex_A53_FLAGS}" CACHE STRING "" FORCE)
