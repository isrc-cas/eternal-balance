set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV32)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(triple riscv32)

set(CMAKE_C_COMPILER /home/pz/llvm-project-master/build/bin/clang)
set(CMAKE_CXX_COMPILER /home/pz/llvm-project-master/build/bin/clang++)

#set(RISCV32_FLAGS "--target=${triple} -Os -march=rv32gc --target=riscv32")
#set(RISCV32_FLAGS "--target=${triple} -Os -O3 --target=riscv32  -march=rv32imafdc -mabi=lp32d --gcc-toolchain=/home/qjivy/toolchain_src/github_riscv/install32elf-v1/ -B/home/qjivy/toolchain_src/github_riscv/install32elf-v1/riscv32-unknown-elf/bin/")
set(RISCV32_FLAGS "--target=${triple} -Os --target=riscv32  -march=rv32imafdc -mabi=ilp32d --gcc-toolchain=/home/pz/riscv-gnu-toolchain/mytoolchain/riscv32/ -B/home/pz/riscv-gnu-toolchain/mytoolchain/riscv32/riscv32-unknown-elf/bin/")
set(CMAKE_C_FLAGS "${RISCV32_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${RISCV32_FLAGS}" CACHE STRING "" FORCE)
