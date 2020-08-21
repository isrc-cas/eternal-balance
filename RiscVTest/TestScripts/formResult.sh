#!/bin/bash

# this script can generate result automatically

set -e

CURRENT_DIR=$(pwd)
echo $CURRENT_DIR

cd $CURRENT_DIR/ExampleUnits
if [ $(ls) == "" ]
then
  echo ERROR: ExampleUnits should not be empty!!!
  exit
fi
# put the results of riscv-test into outputs.csv
for example in $(ls .)
do
  cd $example
  echo $(pwd)
  echo $(date) > spike_outputs.csv
  echo $(date) > qemu_outputs.csv

  ISA_BINS=$(ls isa/rv* | grep -v '.dump')
  for bin in $ISA_BINS
  do
    if [ ! -f $bin ]
    then
      echo "Fatal Error: can't find $bin!!!"
      exit
    fi

    spike $bin
    echo $bin, $? >> spike_outputs.csv
    
    qemu-riscv64 $bin
    echo $bin, $? >> qemu_outputs.csv

  done
  cd .. # $CURRENT_DIR/ExampleUnits
done