#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
