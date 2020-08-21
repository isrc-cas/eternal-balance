#!/bin/bash

# ./autoTest.sh 
# this script defined the control flow
# please read the README to get full argument usages

set -e

# ./autoTest.sh clean
# remove all caches
if [ $1 == "clean" ]
then
  rm -rf SourceCodes
  mkdir SourceCodes

  rm -rf BinaryExecutes
  mkdir BinaryExecutes
  
  rm -rf ExampleUnits
  mkdir ExampleUnits
  exit
fi

# store all source code by git clone
mkdir SourceCodes
# store all compiled toolchain and extra tools
mkdir BinaryExecutes
# store all test examples
mkdir ExampleUnits

if [ ! -d "TestScripts" ]
then
  echo ERROR: can not find TestScripts !!!
  exit
fi

# git clone Source Codes
TestScripts/getSourceCodes.sh

# compile all commits
TestScripts/generateCommits.sh $*

# run test
TestScripts/runUnitTest.sh

# form result
TestScripts/formResult.sh