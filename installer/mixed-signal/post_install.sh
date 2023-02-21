#!/bin/bash

set -e

mkdir -p $PREFIX/etc/conda/activate.d

# https://github.com/RTimothyEdwards/open_pdks/issues/332
sed -i -e 's/\/tech\/sky130/\/tech/' $PREFIX/share/pdk/sky130A/libs.tech/klayout/tech/sky130A.lyt

# set path to pdks
cat > $PREFIX/etc/conda/activate.d/open_pdks_activate.sh <<EOF
export PDK_ROOT=\$CONDA_PREFIX/share/pdk
EOF

# fix up yosys dep
(cd $PREFIX/lib && ln -s libffi.so.7 libffi.so.6)
