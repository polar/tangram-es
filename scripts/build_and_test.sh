#!/bin/bash
rm -rf CMakeCache.txt CMakeFiles build cmake-build-debug
mkdir build
cd build
cmake ..
cd ..
make clean
make tests
test_dir="build/tests/bin"
if [[ $1 ]]; then
    test_dir=$1
fi
pushd build/tests/bin
: failed=0
for file in unit/*.out
    do
        echo "Running ${file}"
        $file
        if [[ $? != 0 ]]; then
           ((failed=$failed+1))
        fi
    done
popd
exit $failed
