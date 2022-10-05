#!/bin/bash

set -ex

cat >> $PREFIX/share/openlane/install/env.tcl <<EOF
set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"
set ::env(STD_CELL_LIBRARY_OPT) "gf180mcu_fd_sc_mcu7t5v0"
EOF
