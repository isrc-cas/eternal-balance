#!/bin/bash

# this script can test units automatically

set -e

CURRENT_DIR=$(pwd)
echo $CURRENT_DIR
RISCV_TEST=$CURRENT_DIR/SourceCodes/riscv-tests
COMPILERS=$(ls $CURRENT_DIR/BinaryExecutes/)


# judge gnu or rvv, x86 or x64
for compiler in $COMPILERS
do
  echo $compiler
  if [ ${compiler:0:13} == "riscv-gnu-32-" ]
  then
    XLEN=32
    GNU_RVV=GNU
  elif [ ${compiler:0:13} == "riscv-gnu-64-" ]
  then
    XLEN=64
    GNU_RVV=GNU
  elif [ ${compiler:0:4} == "rvv-" ]
  then
    XLEN=64
    GNU_RVV=RVV
  else
    echo ERROR: Wrong argument $compiler
    exit
  fi

  cd $CURRENT_DIR/ExampleUnits
  mkdir $compiler
  cd $compiler

  # compile benchmarks
  mkdir benchmarks
  cd benchmarks
  cp $CURRENT_DIR/SourceCodes/riscv-tests/benchmarks/Makefile .
  if [ $? != 0 ]
  then
    echo ERROR: can not find Makefile!!!
  fi
  echo $(date) > outputs.log
  if [ $GNU_RVV == GNU ]
  then
    make src_dir=$RISCV_TEST/benchmarks RISCV_PREFIX=$CURRENT_DIR/BinaryExecutes/$compiler/build/bin/riscv$XLEN-unknown-elf- XLEN=$XLEN -j32 &>> outputs.log
  elif  [ $GNU_RVV == RVV ]
  then
    make src_dir=$RISCV_TEST/benchmarks RISCV_GCC=clang XLEN=$XLEN -j32 &>> outputs.log
  fi
  cd ..

  # compile isa
  mkdir isa
  cd isa
  cp $CURRENT_DIR/SourceCodes/riscv-tests/isa/Makefile .
  if [ $? != 0 ]
  then
    echo ERROR: can not find Makefile!!!
  fi
  echo $(date) > outputs.log
  if [ $GNU_RVV == GNU ]
  then
    make src_dir=$RISCV_TEST/isa RISCV_PREFIX=$CURRENT_DIR/BinaryExecutes/$compiler/build/bin/riscv$XLEN-unknown-elf- XLEN=$XLEN -j32 &>> outputs.log
  elif  [ $GNU_RVV == RVV ]
  then
    make src_dir=$RISCV_TEST/isa RISCV_GCC=clang XLEN=$XLEN -j32 &>> outputs.log
  fi
  cd ..
  cd $CURRENT_DIR/ExampleUnits

done

cd $CURRENT_DIR