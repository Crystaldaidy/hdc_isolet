# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 30 \
    name hcl_trainLabels_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hcl_trainLabels_V \
    op interface \
    ports { hcl_trainLabels_V_address0 { O 13 vector } hcl_trainLabels_V_ce0 { O 1 bit } hcl_trainLabels_V_d0 { O 32 vector } hcl_trainLabels_V_q0 { I 32 vector } hcl_trainLabels_V_we0 { O 1 bit } hcl_trainLabels_V_address1 { O 13 vector } hcl_trainLabels_V_ce1 { O 1 bit } hcl_trainLabels_V_d1 { O 32 vector } hcl_trainLabels_V_q1 { I 32 vector } hcl_trainLabels_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hcl_trainLabels_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 31 \
    name hcl_in_train_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hcl_in_train_V \
    op interface \
    ports { hcl_in_train_V_address0 { O 20 vector } hcl_in_train_V_ce0 { O 1 bit } hcl_in_train_V_d0 { O 64 vector } hcl_in_train_V_q0 { I 64 vector } hcl_in_train_V_we0 { O 1 bit } hcl_in_train_V_address1 { O 20 vector } hcl_in_train_V_ce1 { O 1 bit } hcl_in_train_V_d1 { O 64 vector } hcl_in_train_V_q1 { I 64 vector } hcl_in_train_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hcl_in_train_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 32 \
    name compute1_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename compute1_V \
    op interface \
    ports { compute1_V_address0 { O 5 vector } compute1_V_ce0 { O 1 bit } compute1_V_d0 { O 32 vector } compute1_V_q0 { I 32 vector } compute1_V_we0 { O 1 bit } compute1_V_address1 { O 5 vector } compute1_V_ce1 { O 1 bit } compute1_V_d1 { O 32 vector } compute1_V_q1 { I 32 vector } compute1_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'compute1_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name hcl_rdv3_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hcl_rdv3_V \
    op interface \
    ports { hcl_rdv3_V_address0 { O 18 vector } hcl_rdv3_V_ce0 { O 1 bit } hcl_rdv3_V_d0 { O 64 vector } hcl_rdv3_V_q0 { I 64 vector } hcl_rdv3_V_we0 { O 1 bit } hcl_rdv3_V_address1 { O 18 vector } hcl_rdv3_V_ce1 { O 1 bit } hcl_rdv3_V_d1 { O 64 vector } hcl_rdv3_V_q1 { I 64 vector } hcl_rdv3_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hcl_rdv3_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name prototype_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prototype_V \
    op interface \
    ports { prototype_V_address0 { O 12 vector } prototype_V_ce0 { O 1 bit } prototype_V_d0 { O 64 vector } prototype_V_q0 { I 64 vector } prototype_V_we0 { O 1 bit } prototype_V_address1 { O 12 vector } prototype_V_ce1 { O 1 bit } prototype_V_d1 { O 64 vector } prototype_V_q1 { I 64 vector } prototype_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prototype_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name prototypeCounter_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prototypeCounter_V \
    op interface \
    ports { prototypeCounter_V_address0 { O 18 vector } prototypeCounter_V_ce0 { O 1 bit } prototypeCounter_V_d0 { O 32 vector } prototypeCounter_V_q0 { I 32 vector } prototypeCounter_V_we0 { O 1 bit } prototypeCounter_V_address1 { O 18 vector } prototypeCounter_V_ce1 { O 1 bit } prototypeCounter_V_d1 { O 32 vector } prototypeCounter_V_q1 { I 32 vector } prototypeCounter_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prototypeCounter_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


