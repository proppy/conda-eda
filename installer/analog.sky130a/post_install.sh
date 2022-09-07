#!/bin/bash

set -ex

cat >> $PREFIX/bin/xschem-sky130a <<EOF
XSCHEMRC=$(readlink -f ../share/pdk/sky130A/libs.tech/xschem/xschemrc)
exec xschem --rcfile XSCHEMRC
EOF
chmod +x $PREFIX/bin/xschem-sky130a

cat >> $PREFIX/bin/magic-sky130a <<EOF
MAGICRC=$(readlink -f ../share/pdk/sky130A/libs.tech/magic/sky130A.magicrc)
exec magic --rcfile MAGICRC
EOF
chmod +x $PREFIX/bin/magic-sky130a

cat >> $PREFIX/bin/klayout-sky130a <<EOF
export KLAYOUTHOME=$(readlink -f ../share/pdk/sky130A/libs.tech/klayout)
exec klayout
EOF
chmod +x $PREFIX/bin/klayout-sky130a
