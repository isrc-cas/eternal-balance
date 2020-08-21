#!/bin/bash

# this script can compile commit automatically
# arguments inherited from autoTest.sh

set -e

CurrentDir=$(pwd)

# commit or branch
# detailed usage can refer README
if [ $# != 0 ]
then
  for arg in $*
  do
    if [ ${arg:0:1} == 'g' ]
    then
      GNU_ARGS=("${GNU_ARGS[@]}" ${arg:2})
    elif [ ${arg:0:1} == 'r' ]
    then
      RVV_ARGS=("${RVV_ARGS[@]}" ${arg:2})
    else
      echo "Error: Argument is WRONG!!!"
      exit
    fi
  done
else
  cd $CurrentDir/SourceCodes/riscv-gnu-toolchain
  GNU_ARGS=$(git tag)
  cd $CurrentDir/SourceCodes/rvv-llvm
  RVV_ARGS=$(git tag)
fi

echo GNU: ${GNU_ARGS[*]}
echo RVV: ${RVV_ARGS[*]}

for commit in $GNU_ARGS
do
  cd $CurrentDir/SourceCodes/riscv-gnu-toolchain
  git checkout $commit
  if [ $? != 0]
  then
    echo ERROR: git checkout fail!!!
    exit
  fi
  # compile gnu-toolchain x86
  cd $CurrentDir/BinaryExecutes
  mkdir -p riscv-gnu-32-$commit/build
  cd riscv-gnu-32-$commit
  $CurrentDir/SourceCodes/riscv-gnu-toolchain/configure --prefix=$CurrentDir/BinaryExecutes/riscv-gnu-32-$commit/build --with-arch=rv32gc --with-abi=ilp32d
  make newlib -j$(nproc)
  make linux -j$(nproc)
  cd ..
  # compile gnu-toolchain x64
  mkdir -p riscv-gnu-64-$commit/build
  cd riscv-gnu-64-$commit
  $CurrentDir/SourceCodes/riscv-gnu-toolchain/configure --prefix=$CurrentDir/BinaryExecutes/riscv-gnu-64-$commit/build --with-arch=rv64gc --with-abi=lp64d
  make newlib -j$(nproc)
  make linux -j$(nproc)
  cd ..
done
# compile rvv-llvm
cd $CurrentDir/BinaryExecutes
for commit in $RVV_ARGS
do
  mkdir rvv-$commit
  cd rvv-$commit
  mkdir build && cd build
  cmake -DLLVM_TARGETS_TO_BUILD="RISCV" -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" $CurrentDir/SourceCodes/rvv-llvm/llvm
  make -j$(nproc)
  cd ../..
done
cd $CurrentDir