#!/bin/bash

set -e

export TMPDIR=$(mktemp -d)
patch -p1 -d $PREFIX <<EOF
diff -Nru analog-env-1/share/pdk/sky130A/libs.tech/klayout/tech/sky130A.lyt analog-env-2/share/pdk/sky130A/libs.tech/klayout/tech/sky130A.lyt
--- analog-env-1/share/pdk/sky130A/libs.tech/klayout/tech/sky130A.lyt	2022-12-22 08:39:42.000000000 +0900
+++ analog-env-2/share/pdk/sky130A/libs.tech/klayout/tech/sky130A.lyt	2022-12-24 16:27:20.880630887 +0900
@@ -4,9 +4,9 @@
  <description>SkyWater 130nm technology</description>
  <group/>
  <dbu>0.001</dbu>
- <base-path>\$(appdata_path)/tech/sky130</base-path>
- <original-base-path>\$(appdata_path)/tech/sky130</original-base-path>
- <layer-properties_file>sky130.lyp</layer-properties_file>
+ <base-path>\$(appdata_path)/tech</base-path>
+ <original-base-path>\$(appdata_path)/tech</original-base-path>
+ <layer-properties_file>sky130A.lyp</layer-properties_file>
  <add-other-layers>true</add-other-layers>
  <reader-options>
   <gds2>
EOF

cat > $PREFIX/etc/conda/activate.d/open_pdks_activate.sh <<EOF
export PDK_ROOT=\$CONDA_PREFIX/share/pdk
EOF

cat > $PREFIX/etc/conda/activate.d/klayout_activate.sh <<EOF
export KLAYOUT_PATH=\$CONDA_PREFIX/share/pdk/sky130A/libs.tech/klayout
EOF

(cd $PREFIX/share/pdk/sky130A/libs.tech/ngspice && ln spinit .spiceinit)
cat > $PREFIX/etc/conda/activate.d/ngspice_activate.sh <<EOF
export SPICE_USERINIT_DIR=\$CONDA_PREFIX/share/pdk/sky130A/libs.tech/ngspice
EOF

ln -s $CONDA_PREFIX/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc $PREFIX/lib/magic/sys/site.def

ln -sf $CONDA_PREFIX/share/pdk/sky130A/libs.tech/xschem/xschemrc $CONDA_PREFIX/share/xschem/xschemrc
