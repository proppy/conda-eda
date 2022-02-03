#!/bin/bash
set -ex

# make timing
for LIB in skywater-pdk/libraries/sky130_*_sc_*/latest; do
  if [ -d "$LIB/cells" ]; then
    python -m skywater_pdk.liberty $LIB
    python -m skywater_pdk.liberty $LIB all
    python -m skywater_pdk.liberty $LIB all --ccsnoise
  fi
done

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
