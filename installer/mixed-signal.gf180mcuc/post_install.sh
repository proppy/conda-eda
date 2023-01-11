#!/bin/bash

set -e
# set gf180mcuc defaults
cat > $PREFIX/etc/conda/activate.d/open_pdks_activate.sh <<EOF
export PDK_ROOT=\$CONDA_PREFIX/share/pdk
export PDK=gf180mcuc
EOF

cat > $PREFIX/etc/conda/activate.d/klayout_activate.sh <<EOF
export KLAYOUT_HOME=\$CONDA_PREFIX/share/pdk/\$PDK/libs.tech/klayout
EOF

(cd $PREFIX/share/pdk/sky130A/libs.tech/ngspice && ln spinit .spiceinit)
cat > $PREFIX/etc/conda/activate.d/ngspice_activate.sh <<EOF
export SPICE_USERINIT_DIR=\$CONDA_PREFIX/share/pdk/\$PDK/libs.tech/ngspice
EOF

mv $PREFIX/bin/magic $PREFIX/bin/magic.real
cat > $PREFIX/bin/magic <<EOF
magic.real -rcfile \$CONDA_PREFIX/share/pdk/$\PDK/libs.tech/magic/\$PDK.magicrc \$@
EOF
chmod +x $PREFIX/bin/magic

mv $PREFIX/bin/xschem $PREFIX/bin/xschem.real
cat > $PREFIX/bin/xschem <<EOF
xschem.real --rcfile \$CONDA_PREFIX/share/pdk/$\PDK/libs.tech/xschem/xschemrc \$@
EOF
chmod +x $PREFIX/bin/xschem

# fix up yosys dep
(cd $PREFIX/lib && ln -s libffi.so.7 libffi.so.6)
