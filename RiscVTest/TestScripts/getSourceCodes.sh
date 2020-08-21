#!/bin/bash

# this script can git clone automatically

set -e

mkdir SourceCodes
cd SourceCodes
SOURCE=$(pwd)

# git clone riscv-gnu-toolchain
if [ ! -d "riscv-gnu-toolchain" ]
then
  git clone --recursive https://github.com/riscv/riscv-gnu-toolchain.git

  if [ ! -d "riscv-gnu-toolchain" ]
  then
    echo ERROR: can not find riscv-gnu-toolchain!
    exit
  fi

else
  # get all branches updates
  cd riscv-gnu-toolchain
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all

  cd ..
fi

# git clone riscv-pk
if [ ! -d "riscv-pk" ]
then
  git clone https://github.com/riscv/riscv-pk.git

  if [ ! -d "riscv-pk" ]
  then
    echo ERROR: can not find riscv-pk!
    exit
  fi

  # compile riscv-pk
  cd riscv-pk
  mkdir build && cd build
  ../configure --host=riscv64-unknown-elf
  make -j$(nproc)
  cd $SOURCE
else
  # get all branches updates
  cd riscv-pk
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all

  cd ..
fi

# git clone riscv-isa-sim
if [ ! -d "riscv-isa-sim" ]
then
  git clone https://github.com/riscv/riscv-isa-sim.git

  if [ ! -d "riscv-isa-sim" ]
  then
    echo ERROR: can not find riscv-isa-sim!
    exit
  fi

  # compile riscv-isa-sim
  cd riscv-isa-sim
  mkdir build && cd build
  ../configure
  make -j$(nproc)
  cd $SOURCE
else
  # get all branches update
  cd riscv-isa-sim
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all

  cd ..
fi

# git clone rvv-llvm
if [ ! -d "rvv-llvm" ]
then
  git clone https://github.com/isrc-cas/rvv-llvm.git
 
  if [ ! -d "rvv-llvm" ]
  then
    echo ERROR: can not find rvv-llvm!
    exit
  fi

else
  # get all branches update
  cd rvv-llvm
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all

  cd ..
fi

# git clone qemu from qemu.org
if [ ! -d "qemu" ]
then
  git clone https://git.qemu.org/git/qemu.git

  if [ ! -d "qemu" ]
  then
    echo ERROR: can not find qemu!
    exit
  fi

  # compile qemu
  cd qemu
  mkdir build && cd build
  ../configure --target-list=riscv64-linux-user,riscv64-softmmu
  make -j$(nproc)
  cd $SOURCE
else
  # get all branches update
  cd qemu
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all

  cd ..
fi

# git clone riscv-tests
if [ ! -d "riscv-tests" ]
then
  git clone --recursive https://github.com/riscv/riscv-tests.git

  if [ ! -d "riscv-tests" ]
  then
    echo ERROR: can not find riscv-tests!
    exit
  fi
else

  # get all branches update
  cd riscv-tests
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all

  cd ..
fi

cd .. # .