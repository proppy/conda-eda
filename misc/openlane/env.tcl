# define system variables
set ::env(OPENLANE_ROOT) "$::env(CONDA_PREFIX)/share/openlane"
set ::env(OL_INSTALL_DIR) "$::env(CONDA_PREFIX)/share/openlane/install"
set ::env(OPENLANE_LOCAL_INSTALL) 1
if { ! [info exists ::env(TCLLIBPATH)] } {
    set ::env(TCLLIBPATH) [glob -type d "/usr/share/tcltk/tcllib*"]
}
lappend ::auto_path $::env(TCLLIBPATH)
# define PDK variables
set ::env(PDK_ROOT) "$::env(CONDA_PREFIX)/share/pdk"
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"
set ::env(STD_CELL_LIBRARY_OPT) "sky130_fd_sc_hd"
