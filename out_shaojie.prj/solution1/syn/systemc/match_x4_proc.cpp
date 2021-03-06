// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "match_x4_proc.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic match_x4_proc::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic match_x4_proc::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<7> match_x4_proc::ap_ST_fsm_state1 = "1";
const sc_lv<7> match_x4_proc::ap_ST_fsm_state2 = "10";
const sc_lv<7> match_x4_proc::ap_ST_fsm_state3 = "100";
const sc_lv<7> match_x4_proc::ap_ST_fsm_state4 = "1000";
const sc_lv<7> match_x4_proc::ap_ST_fsm_state5 = "10000";
const sc_lv<7> match_x4_proc::ap_ST_fsm_state6 = "100000";
const sc_lv<7> match_x4_proc::ap_ST_fsm_state7 = "1000000";
const sc_lv<32> match_x4_proc::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> match_x4_proc::ap_const_lv32_6 = "110";
const sc_lv<1> match_x4_proc::ap_const_lv1_1 = "1";
const sc_lv<32> match_x4_proc::ap_const_lv32_3 = "11";
const sc_lv<1> match_x4_proc::ap_const_lv1_0 = "0";
const sc_lv<32> match_x4_proc::ap_const_lv32_1 = "1";
const sc_lv<32> match_x4_proc::ap_const_lv32_2 = "10";
const sc_lv<13> match_x4_proc::ap_const_lv13_0 = "0000000000000";
const sc_lv<20> match_x4_proc::ap_const_lv20_0 = "00000000000000000000";
const sc_lv<8> match_x4_proc::ap_const_lv8_0 = "00000000";
const sc_lv<64> match_x4_proc::ap_const_lv64_0 = "0000000000000000000000000000000000000000000000000000000000000000";
const sc_lv<32> match_x4_proc::ap_const_lv32_4 = "100";
const sc_lv<32> match_x4_proc::ap_const_lv32_5 = "101";
const sc_lv<20> match_x4_proc::ap_const_lv20_9C = "10011100";
const sc_lv<13> match_x4_proc::ap_const_lv13_185E = "1100001011110";
const sc_lv<13> match_x4_proc::ap_const_lv13_1 = "1";
const sc_lv<8> match_x4_proc::ap_const_lv8_9C = "10011100";
const sc_lv<8> match_x4_proc::ap_const_lv8_1 = "1";
const bool match_x4_proc::ap_const_boolean_1 = true;

match_x4_proc::match_x4_proc(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_add_ln321_fu_245_p2);
    sensitive << ( phi_mul_reg_161 );
    sensitive << ( zext_ln321_fu_241_p1 );

    SC_METHOD(thread_add_ln887_fu_206_p2);
    sensitive << ( phi_mul_reg_161 );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state3);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state4);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state5);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state6);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state7);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_block_state1);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( p_0510_0_out_full_n );

    SC_METHOD(thread_ap_block_state4);
    sensitive << ( match2_full_n );
    sensitive << ( icmp_ln879_fu_251_p2 );

    SC_METHOD(thread_ap_block_state7);
    sensitive << ( match2_full_n );
    sensitive << ( icmp_ln879_reg_301 );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln887_fu_212_p2 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_phi_mux_storemerge_i_i_phi_fu_188_p4);
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );
    sensitive << ( storemerge_i_i_reg_184 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln887_fu_212_p2 );

    SC_METHOD(thread_compute2_V1_address0);
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( compute2_V1_addr_reg_260 );

    SC_METHOD(thread_compute2_V1_ce0);
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );

    SC_METHOD(thread_compute2_V1_d0);
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( ap_phi_mux_storemerge_i_i_phi_fu_188_p4 );

    SC_METHOD(thread_compute2_V1_we0);
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );

    SC_METHOD(thread_hcl_in_train_V_address0);
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( zext_ln321_2_fu_256_p1 );

    SC_METHOD(thread_hcl_in_train_V_ce0);
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( icmp_ln879_fu_251_p2 );
    sensitive << ( ap_CS_fsm_state5 );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_hcl_trainLabels_V_address0);
    sensitive << ( hcl_trainLabels_V_ad_reg_283 );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_hcl_trainLabels_V_ce0);
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_icmp_ln879_fu_251_p2);
    sensitive << ( hcl_trainLabels_V_q0 );
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( icmp_ln879_fu_251_p2 );
    sensitive << ( zext_ln32_reg_265 );

    SC_METHOD(thread_icmp_ln887_28_fu_229_p2);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( p_0618_0_i_i_reg_173 );

    SC_METHOD(thread_icmp_ln887_fu_212_p2);
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( p_0465_0_i_i_reg_150 );

    SC_METHOD(thread_match2_blk_n);
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( icmp_ln879_fu_251_p2 );

    SC_METHOD(thread_match2_din);
    sensitive << ( hcl_in_train_V_q0 );
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( icmp_ln879_fu_251_p2 );

    SC_METHOD(thread_match2_write);
    sensitive << ( match2_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( icmp_ln879_fu_251_p2 );

    SC_METHOD(thread_p_0510_0_out_blk_n);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( p_0510_0_out_full_n );

    SC_METHOD(thread_p_0510_0_out_din);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( p_0510_0 );
    sensitive << ( p_0510_0_out_full_n );

    SC_METHOD(thread_p_0510_0_out_write);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( p_0510_0_out_full_n );

    SC_METHOD(thread_x4_V_fu_218_p2);
    sensitive << ( p_0465_0_i_i_reg_150 );

    SC_METHOD(thread_y2_V_fu_235_p2);
    sensitive << ( p_0618_0_i_i_reg_173 );

    SC_METHOD(thread_zext_ln321_2_fu_256_p1);
    sensitive << ( add_ln321_reg_296 );

    SC_METHOD(thread_zext_ln321_fu_241_p1);
    sensitive << ( p_0618_0_i_i_reg_173 );

    SC_METHOD(thread_zext_ln32_fu_202_p1);
    sensitive << ( p_0510_0 );

    SC_METHOD(thread_zext_ln544_21_fu_224_p1);
    sensitive << ( p_0465_0_i_i_reg_150 );

    SC_METHOD(thread_zext_ln544_fu_197_p1);
    sensitive << ( p_0510_0 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( match2_full_n );
    sensitive << ( p_0510_0_out_full_n );
    sensitive << ( ap_CS_fsm_state7 );
    sensitive << ( icmp_ln879_reg_301 );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( icmp_ln879_fu_251_p2 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln887_fu_212_p2 );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln887_28_fu_229_p2 );

    ap_done_reg = SC_LOGIC_0;
    ap_CS_fsm = "0000001";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "match_x4_proc_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_continue, "(port)ap_continue");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, hcl_trainLabels_V_address0, "(port)hcl_trainLabels_V_address0");
    sc_trace(mVcdFile, hcl_trainLabels_V_ce0, "(port)hcl_trainLabels_V_ce0");
    sc_trace(mVcdFile, hcl_trainLabels_V_q0, "(port)hcl_trainLabels_V_q0");
    sc_trace(mVcdFile, compute2_V1_address0, "(port)compute2_V1_address0");
    sc_trace(mVcdFile, compute2_V1_ce0, "(port)compute2_V1_ce0");
    sc_trace(mVcdFile, compute2_V1_we0, "(port)compute2_V1_we0");
    sc_trace(mVcdFile, compute2_V1_d0, "(port)compute2_V1_d0");
    sc_trace(mVcdFile, p_0510_0, "(port)p_0510_0");
    sc_trace(mVcdFile, hcl_in_train_V_address0, "(port)hcl_in_train_V_address0");
    sc_trace(mVcdFile, hcl_in_train_V_ce0, "(port)hcl_in_train_V_ce0");
    sc_trace(mVcdFile, hcl_in_train_V_q0, "(port)hcl_in_train_V_q0");
    sc_trace(mVcdFile, match2_din, "(port)match2_din");
    sc_trace(mVcdFile, match2_full_n, "(port)match2_full_n");
    sc_trace(mVcdFile, match2_write, "(port)match2_write");
    sc_trace(mVcdFile, p_0510_0_out_din, "(port)p_0510_0_out_din");
    sc_trace(mVcdFile, p_0510_0_out_full_n, "(port)p_0510_0_out_full_n");
    sc_trace(mVcdFile, p_0510_0_out_write, "(port)p_0510_0_out_write");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_done_reg, "ap_done_reg");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, match2_blk_n, "match2_blk_n");
    sc_trace(mVcdFile, ap_CS_fsm_state7, "ap_CS_fsm_state7");
    sc_trace(mVcdFile, icmp_ln879_reg_301, "icmp_ln879_reg_301");
    sc_trace(mVcdFile, ap_CS_fsm_state4, "ap_CS_fsm_state4");
    sc_trace(mVcdFile, icmp_ln879_fu_251_p2, "icmp_ln879_fu_251_p2");
    sc_trace(mVcdFile, p_0510_0_out_blk_n, "p_0510_0_out_blk_n");
    sc_trace(mVcdFile, compute2_V1_addr_reg_260, "compute2_V1_addr_reg_260");
    sc_trace(mVcdFile, ap_block_state1, "ap_block_state1");
    sc_trace(mVcdFile, zext_ln32_fu_202_p1, "zext_ln32_fu_202_p1");
    sc_trace(mVcdFile, zext_ln32_reg_265, "zext_ln32_reg_265");
    sc_trace(mVcdFile, add_ln887_fu_206_p2, "add_ln887_fu_206_p2");
    sc_trace(mVcdFile, add_ln887_reg_270, "add_ln887_reg_270");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, x4_V_fu_218_p2, "x4_V_fu_218_p2");
    sc_trace(mVcdFile, x4_V_reg_278, "x4_V_reg_278");
    sc_trace(mVcdFile, hcl_trainLabels_V_ad_reg_283, "hcl_trainLabels_V_ad_reg_283");
    sc_trace(mVcdFile, icmp_ln887_fu_212_p2, "icmp_ln887_fu_212_p2");
    sc_trace(mVcdFile, y2_V_fu_235_p2, "y2_V_fu_235_p2");
    sc_trace(mVcdFile, y2_V_reg_291, "y2_V_reg_291");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, add_ln321_fu_245_p2, "add_ln321_fu_245_p2");
    sc_trace(mVcdFile, add_ln321_reg_296, "add_ln321_reg_296");
    sc_trace(mVcdFile, icmp_ln887_28_fu_229_p2, "icmp_ln887_28_fu_229_p2");
    sc_trace(mVcdFile, ap_block_state4, "ap_block_state4");
    sc_trace(mVcdFile, p_0465_0_i_i_reg_150, "p_0465_0_i_i_reg_150");
    sc_trace(mVcdFile, phi_mul_reg_161, "phi_mul_reg_161");
    sc_trace(mVcdFile, p_0618_0_i_i_reg_173, "p_0618_0_i_i_reg_173");
    sc_trace(mVcdFile, ap_block_state7, "ap_block_state7");
    sc_trace(mVcdFile, ap_phi_mux_storemerge_i_i_phi_fu_188_p4, "ap_phi_mux_storemerge_i_i_phi_fu_188_p4");
    sc_trace(mVcdFile, storemerge_i_i_reg_184, "storemerge_i_i_reg_184");
    sc_trace(mVcdFile, zext_ln544_fu_197_p1, "zext_ln544_fu_197_p1");
    sc_trace(mVcdFile, zext_ln544_21_fu_224_p1, "zext_ln544_21_fu_224_p1");
    sc_trace(mVcdFile, zext_ln321_2_fu_256_p1, "zext_ln321_2_fu_256_p1");
    sc_trace(mVcdFile, ap_CS_fsm_state5, "ap_CS_fsm_state5");
    sc_trace(mVcdFile, ap_CS_fsm_state6, "ap_CS_fsm_state6");
    sc_trace(mVcdFile, zext_ln321_fu_241_p1, "zext_ln321_fu_241_p1");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

match_x4_proc::~match_x4_proc() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

}

void match_x4_proc::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_done_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_continue.read())) {
            ap_done_reg = ap_const_logic_0;
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                    esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_fu_212_p2.read()))) {
            ap_done_reg = ap_const_logic_1;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_28_fu_229_p2.read()))) {
        p_0465_0_i_i_reg_150 = x4_V_reg_278.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || esl_seteq<1,1,1>(ap_const_logic_0, p_0510_0_out_full_n.read())))) {
        p_0465_0_i_i_reg_150 = ap_const_lv13_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
         !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        p_0618_0_i_i_reg_173 = y2_V_reg_291.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln887_fu_212_p2.read()))) {
        p_0618_0_i_i_reg_173 = ap_const_lv8_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_28_fu_229_p2.read()))) {
        phi_mul_reg_161 = add_ln887_reg_270.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || esl_seteq<1,1,1>(ap_const_logic_0, p_0510_0_out_full_n.read())))) {
        phi_mul_reg_161 = ap_const_lv20_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
         esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && 
         !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        storemerge_i_i_reg_184 = ap_const_lv1_1;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && 
                !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        storemerge_i_i_reg_184 = ap_const_lv1_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln887_28_fu_229_p2.read()))) {
        add_ln321_reg_296 = add_ln321_fu_245_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        add_ln887_reg_270 = add_ln887_fu_206_p2.read();
        x4_V_reg_278 = x4_V_fu_218_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || esl_seteq<1,1,1>(ap_const_logic_0, p_0510_0_out_full_n.read())))) {
        compute2_V1_addr_reg_260 =  (sc_lv<5>) (zext_ln544_fu_197_p1.read());
        zext_ln32_reg_265 = zext_ln32_fu_202_p1.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln887_fu_212_p2.read()))) {
        hcl_trainLabels_V_ad_reg_283 =  (sc_lv<13>) (zext_ln544_21_fu_224_p1.read());
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        icmp_ln879_reg_301 = icmp_ln879_fu_251_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        y2_V_reg_291 = y2_V_fu_235_p2.read();
    }
}

void match_x4_proc::thread_add_ln321_fu_245_p2() {
    add_ln321_fu_245_p2 = (!phi_mul_reg_161.read().is_01() || !zext_ln321_fu_241_p1.read().is_01())? sc_lv<20>(): (sc_biguint<20>(phi_mul_reg_161.read()) + sc_biguint<20>(zext_ln321_fu_241_p1.read()));
}

void match_x4_proc::thread_add_ln887_fu_206_p2() {
    add_ln887_fu_206_p2 = (!phi_mul_reg_161.read().is_01() || !ap_const_lv20_9C.is_01())? sc_lv<20>(): (sc_biguint<20>(phi_mul_reg_161.read()) + sc_biguint<20>(ap_const_lv20_9C));
}

void match_x4_proc::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void match_x4_proc::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void match_x4_proc::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void match_x4_proc::thread_ap_CS_fsm_state4() {
    ap_CS_fsm_state4 = ap_CS_fsm.read()[3];
}

void match_x4_proc::thread_ap_CS_fsm_state5() {
    ap_CS_fsm_state5 = ap_CS_fsm.read()[4];
}

void match_x4_proc::thread_ap_CS_fsm_state6() {
    ap_CS_fsm_state6 = ap_CS_fsm.read()[5];
}

void match_x4_proc::thread_ap_CS_fsm_state7() {
    ap_CS_fsm_state7 = ap_CS_fsm.read()[6];
}

void match_x4_proc::thread_ap_block_state1() {
    ap_block_state1 = (esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || esl_seteq<1,1,1>(ap_const_logic_0, p_0510_0_out_full_n.read()));
}

void match_x4_proc::thread_ap_block_state4() {
    ap_block_state4 = (esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read()));
}

void match_x4_proc::thread_ap_block_state7() {
    ap_block_state7 = (esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read()));
}

void match_x4_proc::thread_ap_done() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_fu_212_p2.read()))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_done_reg.read();
    }
}

void match_x4_proc::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void match_x4_proc::thread_ap_phi_mux_storemerge_i_i_phi_fu_188_p4() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
         esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1))) {
        ap_phi_mux_storemerge_i_i_phi_fu_188_p4 = ap_const_lv1_1;
    } else {
        ap_phi_mux_storemerge_i_i_phi_fu_188_p4 = storemerge_i_i_reg_184.read();
    }
}

void match_x4_proc::thread_ap_ready() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_fu_212_p2.read()))) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void match_x4_proc::thread_compute2_V1_address0() {
    compute2_V1_address0 = compute2_V1_addr_reg_260.read();
}

void match_x4_proc::thread_compute2_V1_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
         !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        compute2_V1_ce0 = ap_const_logic_1;
    } else {
        compute2_V1_ce0 = ap_const_logic_0;
    }
}

void match_x4_proc::thread_compute2_V1_d0() {
    compute2_V1_d0 = ap_phi_mux_storemerge_i_i_phi_fu_188_p4.read();
}

void match_x4_proc::thread_compute2_V1_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
         !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        compute2_V1_we0 = ap_const_logic_1;
    } else {
        compute2_V1_we0 = ap_const_logic_0;
    }
}

void match_x4_proc::thread_hcl_in_train_V_address0() {
    hcl_in_train_V_address0 =  (sc_lv<20>) (zext_ln321_2_fu_256_p1.read());
}

void match_x4_proc::thread_hcl_in_train_V_ce0() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read()))) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
          !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read()))) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()))) {
        hcl_in_train_V_ce0 = ap_const_logic_1;
    } else {
        hcl_in_train_V_ce0 = ap_const_logic_0;
    }
}

void match_x4_proc::thread_hcl_trainLabels_V_address0() {
    hcl_trainLabels_V_address0 = hcl_trainLabels_V_ad_reg_283.read();
}

void match_x4_proc::thread_hcl_trainLabels_V_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        hcl_trainLabels_V_ce0 = ap_const_logic_1;
    } else {
        hcl_trainLabels_V_ce0 = ap_const_logic_0;
    }
}

void match_x4_proc::thread_icmp_ln879_fu_251_p2() {
    icmp_ln879_fu_251_p2 = (!hcl_trainLabels_V_q0.read().is_01() || !zext_ln32_reg_265.read().is_01())? sc_lv<1>(): sc_lv<1>(hcl_trainLabels_V_q0.read() == zext_ln32_reg_265.read());
}

void match_x4_proc::thread_icmp_ln887_28_fu_229_p2() {
    icmp_ln887_28_fu_229_p2 = (!p_0618_0_i_i_reg_173.read().is_01() || !ap_const_lv8_9C.is_01())? sc_lv<1>(): sc_lv<1>(p_0618_0_i_i_reg_173.read() == ap_const_lv8_9C);
}

void match_x4_proc::thread_icmp_ln887_fu_212_p2() {
    icmp_ln887_fu_212_p2 = (!p_0465_0_i_i_reg_150.read().is_01() || !ap_const_lv13_185E.is_01())? sc_lv<1>(): sc_lv<1>(p_0465_0_i_i_reg_150.read() == ap_const_lv13_185E);
}

void match_x4_proc::thread_match2_blk_n() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
          esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0)))) {
        match2_blk_n = match2_full_n.read();
    } else {
        match2_blk_n = ap_const_logic_1;
    }
}

void match_x4_proc::thread_match2_din() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
         esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && 
         !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        match2_din = hcl_in_train_V_q0.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && 
                !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
        match2_din = ap_const_lv64_0;
    } else {
        match2_din = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    }
}

void match_x4_proc::thread_match2_write() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
          esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && 
          !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read()))) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && 
          esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && 
          !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read()))))) {
        match2_write = ap_const_logic_1;
    } else {
        match2_write = ap_const_logic_0;
    }
}

void match_x4_proc::thread_p_0510_0_out_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
        p_0510_0_out_blk_n = p_0510_0_out_full_n.read();
    } else {
        p_0510_0_out_blk_n = ap_const_logic_1;
    }
}

void match_x4_proc::thread_p_0510_0_out_din() {
    p_0510_0_out_din = p_0510_0.read();
}

void match_x4_proc::thread_p_0510_0_out_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || esl_seteq<1,1,1>(ap_const_logic_0, p_0510_0_out_full_n.read())))) {
        p_0510_0_out_write = ap_const_logic_1;
    } else {
        p_0510_0_out_write = ap_const_logic_0;
    }
}

void match_x4_proc::thread_x4_V_fu_218_p2() {
    x4_V_fu_218_p2 = (!p_0465_0_i_i_reg_150.read().is_01() || !ap_const_lv13_1.is_01())? sc_lv<13>(): (sc_biguint<13>(p_0465_0_i_i_reg_150.read()) + sc_biguint<13>(ap_const_lv13_1));
}

void match_x4_proc::thread_y2_V_fu_235_p2() {
    y2_V_fu_235_p2 = (!p_0618_0_i_i_reg_173.read().is_01() || !ap_const_lv8_1.is_01())? sc_lv<8>(): (sc_biguint<8>(p_0618_0_i_i_reg_173.read()) + sc_biguint<8>(ap_const_lv8_1));
}

void match_x4_proc::thread_zext_ln321_2_fu_256_p1() {
    zext_ln321_2_fu_256_p1 = esl_zext<64,20>(add_ln321_reg_296.read());
}

void match_x4_proc::thread_zext_ln321_fu_241_p1() {
    zext_ln321_fu_241_p1 = esl_zext<20,8>(p_0618_0_i_i_reg_173.read());
}

void match_x4_proc::thread_zext_ln32_fu_202_p1() {
    zext_ln32_fu_202_p1 = esl_zext<32,5>(p_0510_0.read());
}

void match_x4_proc::thread_zext_ln544_21_fu_224_p1() {
    zext_ln544_21_fu_224_p1 = esl_zext<64,13>(p_0465_0_i_i_reg_150.read());
}

void match_x4_proc::thread_zext_ln544_fu_197_p1() {
    zext_ln544_fu_197_p1 = esl_zext<64,5>(p_0510_0.read());
}

void match_x4_proc::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1) || esl_seteq<1,1,1>(ap_const_logic_0, p_0510_0_out_full_n.read())))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_fu_212_p2.read()))) {
                ap_NS_fsm = ap_ST_fsm_state1;
            } else {
                ap_NS_fsm = ap_ST_fsm_state3;
            }
            break;
        case 4 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln887_28_fu_229_p2.read()))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state4;
            }
            break;
        case 8 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
                ap_NS_fsm = ap_ST_fsm_state7;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && !(esl_seteq<1,1,1>(icmp_ln879_fu_251_p2.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())) && esl_seteq<1,1,1>(ap_const_lv1_1, icmp_ln879_fu_251_p2.read()))) {
                ap_NS_fsm = ap_ST_fsm_state5;
            } else {
                ap_NS_fsm = ap_ST_fsm_state4;
            }
            break;
        case 16 : 
            ap_NS_fsm = ap_ST_fsm_state6;
            break;
        case 32 : 
            ap_NS_fsm = ap_ST_fsm_state7;
            break;
        case 64 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state7.read()) && !(esl_seteq<1,1,1>(icmp_ln879_reg_301.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_logic_0, match2_full_n.read())))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else {
                ap_NS_fsm = ap_ST_fsm_state7;
            }
            break;
        default : 
            ap_NS_fsm =  (sc_lv<7>) ("XXXXXXX");
            break;
    }
}

}

