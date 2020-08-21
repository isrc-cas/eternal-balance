# RiscvTest

## Foreword

Hello!

This project is designed to test any specific riscv-toolchain automatically, you will get a series of CSV files which concluded all results in the `ExampleUnits`.

## How to use

Without any arguments, this project will generate all branches of specific riscv-toolchains.

```shell
git clone # this project
./autoTest.sh
```

Or, you can set the arguments.

```shell
git clone # this project
./autoTest.sh g-xxxxxxx r-xxxxxxxx
# g means GNU-toolchain, r means RVV-LLVM, xxxxxxxx can be a branch id or commit id
```

Finally, your CSV files can be find in `ExampleUnits`.