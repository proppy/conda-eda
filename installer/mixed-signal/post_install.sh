#!/bin/bash

set -e

# set sky130a defaults
export TMPDIR=$(mktemp -d)
patch -p1 -d $PREFIX <<EOF
diff -Nru analog-env-1/share/pdk/sky130A/libs.tech/klayout/lvs/sky130.lylvs analog-env-2/share/pdk/sky130A/libs.tech/klayout/lvs/sky130.lylvs
--- analog-env-1/share/pdk/sky130A/libs.tech/klayout/lvs/sky130.lylvs	2022-12-22 08:39:42.000000000 +0900
+++ analog-env-2/share/pdk/sky130A/libs.tech/klayout/lvs/sky130.lylvs	2022-12-24 16:27:38.545631461 +0900
@@ -15,21 +15,6 @@
  <interpreter>dsl</interpreter>
  <dsl-interpreter-name>lvs-dsl-xml</dsl-interpreter-name>
  <text>
-# Copyright 2022 Mabrains
-#
-# This program is free software: you can redistribute it and/or modify
-# it under the terms of the GNU Affero General Public License as published
-# by the Free Software Foundation, either version 3 of the License, or
-# (at your option) any later version.
-# 
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU Affero General Public License for more details.
-# 
-# You should have received a copy of the GNU Affero General Public License
-# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-
 # %include sky130.lvs
 </text>
 </klayout-macro>
diff -Nru analog-env-1/share/pdk/sky130A/libs.tech/klayout/pymacros/SKY130.lym analog-env-2/share/pdk/sky130A/libs.tech/klayout/pymacros/SKY130.lym
--- analog-env-1/share/pdk/sky130A/libs.tech/klayout/pymacros/SKY130.lym	2022-12-22 08:39:42.000000000 +0900
+++ analog-env-2/share/pdk/sky130A/libs.tech/klayout/pymacros/SKY130.lym	2022-12-24 16:27:29.275631205 +0900
@@ -28,7 +28,6 @@
 Sky130()
 
 print("## Skywaters 130nm PDK Pcells loaded.")
-print(sys.path)
 
 </text>
 </klayout-macro>
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

cat >> $PREFIX/share/pdk/gf180mcuC/libs.tech/xschem/xschemrc <<EOF
set XSCHEM_START_WINDOW \${PDK_ROOT}/gf180mcuC/libs.tech/xschem/tests/0_top.sch
append XSCHEM_LIBRARY_PATH :\${PDK_ROOT}/gf180mcuC/libs.tech/xschem
EOF

# fix up yosys dep
(cd $PREFIX/lib && ln -s libffi.so.7 libffi.so.6)
