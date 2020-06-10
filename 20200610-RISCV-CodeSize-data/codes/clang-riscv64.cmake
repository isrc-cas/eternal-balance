set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV64)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(triple riscv64)

set(CMAKE_C_COMPILER /home/pz/llvm-project-master/build/bin/clang)
set(CMAKE_CXX_COMPILER /home/pz/llvm-project-master/build/bin/clang++)

#set(RISCV64_FLAGS "--target=${triple} -Os -march=rv64gc --target=riscv64")
#set(RISCV64_FLAGS "--target=${triple} -Os -O3 --target=riscv64  -march=rv64imafdc -mabi=lp64d --gcc-toolchain=/home/qjivy/toolchain_src/github_riscv/install64elf-v1/ -B/home/qjivy/toolchain_src/github_riscv/install64elf-v1/riscv64-unknown-elf/bin/")
set(RISCV64_FLAGS "--target=${triple} -O3 --target=riscv64  -march=rv64imafdc -mabi=lp64d --gcc-toolchain=/home/pz/riscv-gnu-toolchain/mytoolchain/riscv64/ -B/home/pz/riscv-gnu-toolchain/mytoolchain/riscv64/riscv64-unknown-elf/bin/")
set(CMAKE_C_FLAGS "${RISCV64_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${RISCV64_FLAGS}" CACHE STRING "" FORCE)
