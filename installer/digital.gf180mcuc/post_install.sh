#!/bin/bash

set -e

mkdir -p $PREFIX/etc/conda/activate.d

# set gf180mcuc defaults
cat > $PREFIX/etc/conda/activate.d/open_pdks_activate.sh <<EOF
export PDK_ROOT=\$CONDA_PREFIX/share/pdk
export PDK=gf180mcuC
EOF

# fix up yosys dep
(cd $PREFIX/lib && ln -s libffi.so.7 libffi.so.6)
