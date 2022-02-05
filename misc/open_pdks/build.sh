#!/bin/bash
set -ex

# make timing
pushd $SRC_DIR/skywater-pdk/scripts/python-skywater-pdk/
for LIB in $SRC_DIR/skywater-pdk/libraries/sky130_*_sc_*/latest; do
  if [ -d "$LIB/cells" ]; then
    $PYTHON -m skywater_pdk.liberty $LIB
    $PYTHON -m skywater_pdk.liberty $LIB all
    $PYTHON -m skywater_pdk.liberty $LIB all --ccsnoise
  fi
done
popd

# extract variant name from package name
VARIANT=${PKG_NAME#open_pdks.sky130}
VARIANT=${VARIANT^^}

# --enable-sky130-pdk: point to current checkout
# --disable-alpha-sky130: disable font library
# --disable-xschem-sky130: disable xschem integration
# --with-sky130-variants: use specified variant 
./configure --prefix=$PREFIX \
  --enable-sky130-pdk=$SRC_DIR/skywater-pdk/ \
  --disable-alpha-sky130 \
  --disable-xschem-sky130 \
  --with-sky130-variants=$VARIANT
make
make install
