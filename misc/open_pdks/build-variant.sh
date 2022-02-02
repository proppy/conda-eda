#!/bin/bash
set -ex

VARIANT=${PKG_NAME#open_pdks.sky130}
VARIANT=${VARIANT^^}
./configure --prefix=$PREFIX --enable-sky130-pdk=$PREFIX/share/skywater-pdk/ --disable-alpha-sky130 --disable-xschem-sky130 --with-sky130-variants=$VARIANT
make
make install
