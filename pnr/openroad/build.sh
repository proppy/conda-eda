#!/bin/bash
set -ex

mkdir build
cd build
cmake -DUSE_SYSTEM_BOOST=ON -DALLOW_WARNINGS=ON -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j$CPU_COUNT
make install
