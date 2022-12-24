#!/bin/bash

set -e

mkdir -p $PREFIX/etc/conda/activate.d

# https://github.com/RTimothyEdwards/open_pdks/issues/332
sed -i -e 's/\/tech\/sky130/\/tech/' $PREFIX/share/pdk/sky130A/libs.tech/klayout/tech/sky130A.lyt

# set sky130a defaults
cat > $PREFIX/etc/conda/activate.d/open_pdks_activate.sh <<EOF
export PDK_ROOT=\$CONDA_PREFIX/share/pdk
export PDK=sky130A
EOF

cat > $PREFIX/etc/conda/activate.d/klayout_activate.sh <<EOF
export KLAYOUT_PATH=\$CONDA_PREFIX/share/pdk/sky130A/libs.tech/klayout
EOF

(cd $PREFIX/share/pdk/sky130A/libs.tech/ngspice && ln spinit .spiceinit)
cat > $PREFIX/etc/conda/activate.d/ngspice_activate.sh <<EOF
export SPICE_USERINIT_DIR=\$CONDA_PREFIX/share/pdk/sky130A/libs.tech/ngspice
EOF

ln -s $PREFIX/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc $PREFIX/lib/magic/sys/site.def

ln -sf $PREFIX/share/pdk/sky130A/libs.tech/xschem/xschemrc $PREFIX/share/xschem/xschemrc

# fix up yosys dep
(cd $PREFIX/lib && ln -s libffi.so.7 libffi.so.6)
