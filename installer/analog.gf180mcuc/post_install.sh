#!/bin/bash

set -e

mkdir -p $PREFIX/etc/conda/activate.d

# set gf180mcuc defaults
cat > $PREFIX/etc/conda/activate.d/open_pdks_activate.sh <<EOF
export PDK_ROOT=\$CONDA_PREFIX/share/pdk
export PDK=gf180mcuC
EOF

cat > $PREFIX/etc/conda/activate.d/klayout_activate.sh <<EOF
export KLAYOUT_PATH=\$CONDA_PREFIX/share/pdk/gf180mcuC/libs.tech/klayout
EOF

ln -s $PREFIX/share/pdk/gf180mcuC/libs.tech/magic/gf180mcuC.magicrc $PREFIX/lib/magic/sys/site.def

cat >> $PREFIX/share/pdk/gf180mcuC/libs.tech/xschem/xschemrc <<EOF
set XSCHEM_START_WINDOW \${PDK_ROOT}/gf180mcuC/libs.tech/xschem/tests/0_top.sch
append XSCHEM_LIBRARY_PATH :\${PDK_ROOT}/gf180mcuC/libs.tech/xschem
EOF
sed -i -e 's/ngspice\/models/gf180mcuC\/libs.tech\/ngspice/' $PREFIX/share/pdk/gf180mcuC/libs.tech/xschem/xschemrc 
ln -sf $PREFIX/share/pdk/gf180mcuC/libs.tech/xschem/xschemrc $PREFIX/share/xschem/xschemrc
