#!/bin/bash

set -e
# set gf180mcuc defaults
cat >> $PREFIX/share/openlane/install/env.tcl <<EOF
set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"
set ::env(STD_CELL_LIBRARY_OPT) "sky130_fd_sc_hd"
EOF

# fix up yosys dep
(cd $PREFIX/lib && ln -s libffi.so.7 libffi.so.6)
