riscv32-unknown-elf-gcc -Os -march=rv32imafdc -S `find . -name '*.c' -print`
grep -cE "fma|fms|fnm" `find . -name '*.s' -print` 

#riscv32-unknown-elf-gcc -Os -march=rv32imafdc -S `find . -name '*.c' -print` -I/home/pz/csibe-master/src/CSiBE-v2.1.1/CSiBE/src/teem-1.6.0-src/include

#/home/pz/llvm-project-master/llvm_install_fma/bin/clang -Oz --target=riscv32  -march=rv32imafdc -mabi=ilp32d --gcc-toolchain=/home/pz/riscv-gnu-toolchain/mytoolchain/riscv32/ -B/home/pz/riscv-gnu-toolchain/mytoolchain/riscv32/riscv32-unknown-elf/bin/  -S `find . -name '*.c' -print`  -I/home/pz/csibe-master/src/CSiBE-v2.1.1/CSiBE/src/teem-1.6.0-src/include
