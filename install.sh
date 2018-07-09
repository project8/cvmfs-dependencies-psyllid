#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

cd ${P8DEPPSYLLIDBASEDIR}/src
pwd

echo "where are we?"
pwd

#######################################################################
#
# build all dependencies from source
#
########################################################################


echo "Environment variables:"
env
echo `which python3`
echo `python3 -V`
echo `gcc --version`
echo `python3 --version`
echo `which cc`
echo `which g++`
echo `which ld`
echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"


