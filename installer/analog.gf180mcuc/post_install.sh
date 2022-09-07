#!/bin/bash

set -ex

cat >> $PREFIX/bin/xschem-gf180mcuc <<EOF
XSCHEMRC=$(readlink -f ../share/pdk/gf180mcuC/libs.tech/xschem/xschemrc)
exec xschem --rcfile XSCHEMRC
EOF
chmod +x $PREFIX/bin/xschem-gf180mcuc

cat >> $PREFIX/bin/magic-gf180mcuc <<EOF
MAGICRC=$(readlink -f ../share/pdk/gf180mcuC/libs.tech/magic/gf180mcuC.magicrc)
exec magic --rcfile MAGICRC
EOF
chmod +x $PREFIX/bin/magic-gf180mcuc

cat >> $PREFIX/bin/klayout-gf180mcuc <<EOF
export KLAYOUTHOME=$(readlink -f ../share/pdk/gf180mcuC/libs.tech/klayout)
exec klayout
EOF
chmod +x $PREFIX/bin/klayout-gf180mcuc
