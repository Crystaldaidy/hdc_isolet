set moduleName match_x4_proc
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {match_x4_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ hcl_trainLabels_V int 32 regular {array 6238 { 1 3 } 1 1 }  }
	{ compute2_V1 int 1 regular {array 26 { 0 3 } 0 1 }  }
	{ p_0510_0 int 5 regular  }
	{ hcl_in_train_V int 64 regular {array 973128 { 1 3 } 3 1 }  }
	{ match2 int 64 regular {fifo 1 volatile }  }
	{ p_0510_0_out int 5 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "hcl_trainLabels_V", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "compute2_V1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0510_0", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "hcl_in_train_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "match2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0510_0_out", "interface" : "fifo", "bitwidth" : 5, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ hcl_trainLabels_V_address0 sc_out sc_lv 13 signal 0 } 
	{ hcl_trainLabels_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ hcl_trainLabels_V_q0 sc_in sc_lv 32 signal 0 } 
	{ compute2_V1_address0 sc_out sc_lv 5 signal 1 } 
	{ compute2_V1_ce0 sc_out sc_logic 1 signal 1 } 
	{ compute2_V1_we0 sc_out sc_logic 1 signal 1 } 
	{ compute2_V1_d0 sc_out sc_lv 1 signal 1 } 
	{ p_0510_0 sc_in sc_lv 5 signal 2 } 
	{ hcl_in_train_V_address0 sc_out sc_lv 20 signal 3 } 
	{ hcl_in_train_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ hcl_in_train_V_q0 sc_in sc_lv 64 signal 3 } 
	{ match2_din sc_out sc_lv 64 signal 4 } 
	{ match2_full_n sc_in sc_logic 1 signal 4 } 
	{ match2_write sc_out sc_logic 1 signal 4 } 
	{ p_0510_0_out_din sc_out sc_lv 5 signal 5 } 
	{ p_0510_0_out_full_n sc_in sc_logic 1 signal 5 } 
	{ p_0510_0_out_write sc_out sc_logic 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "hcl_trainLabels_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "address0" }} , 
 	{ "name": "hcl_trainLabels_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "ce0" }} , 
 	{ "name": "hcl_trainLabels_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "q0" }} , 
 	{ "name": "compute2_V1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "compute2_V1", "role": "address0" }} , 
 	{ "name": "compute2_V1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute2_V1", "role": "ce0" }} , 
 	{ "name": "compute2_V1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute2_V1", "role": "we0" }} , 
 	{ "name": "compute2_V1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "compute2_V1", "role": "d0" }} , 
 	{ "name": "p_0510_0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "p_0510_0", "role": "default" }} , 
 	{ "name": "hcl_in_train_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "address0" }} , 
 	{ "name": "hcl_in_train_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "ce0" }} , 
 	{ "name": "hcl_in_train_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "q0" }} , 
 	{ "name": "match2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "match2", "role": "din" }} , 
 	{ "name": "match2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "match2", "role": "full_n" }} , 
 	{ "name": "match2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "match2", "role": "write" }} , 
 	{ "name": "p_0510_0_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "p_0510_0_out", "role": "din" }} , 
 	{ "name": "p_0510_0_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_0510_0_out", "role": "full_n" }} , 
 	{ "name": "p_0510_0_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_0510_0_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "match_x4_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2931861", "EstimateLatencyMax" : "4878117",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "hcl_trainLabels_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "compute2_V1", "Type" : "Memory", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_0510_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "match2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "match2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_0510_0_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "p_0510_0_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	match_x4_proc {
		hcl_trainLabels_V {Type I LastRead 2 FirstWrite -1}
		compute2_V1 {Type O LastRead -1 FirstWrite 6}
		p_0510_0 {Type I LastRead 0 FirstWrite -1}
		hcl_in_train_V {Type I LastRead 3 FirstWrite -1}
		match2 {Type O LastRead -1 FirstWrite 3}
		p_0510_0_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2931861", "Max" : "4878117"}
	, {"Name" : "Interval", "Min" : "2931861", "Max" : "4878117"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	hcl_trainLabels_V { ap_memory {  { hcl_trainLabels_V_address0 mem_address 1 13 }  { hcl_trainLabels_V_ce0 mem_ce 1 1 }  { hcl_trainLabels_V_q0 mem_dout 0 32 } } }
	compute2_V1 { ap_memory {  { compute2_V1_address0 mem_address 1 5 }  { compute2_V1_ce0 mem_ce 1 1 }  { compute2_V1_we0 mem_we 1 1 }  { compute2_V1_d0 mem_din 1 1 } } }
	p_0510_0 { ap_none {  { p_0510_0 in_data 0 5 } } }
	hcl_in_train_V { ap_memory {  { hcl_in_train_V_address0 mem_address 1 20 }  { hcl_in_train_V_ce0 mem_ce 1 1 }  { hcl_in_train_V_q0 mem_dout 0 64 } } }
	match2 { ap_fifo {  { match2_din fifo_data 1 64 }  { match2_full_n fifo_status 0 1 }  { match2_write fifo_update 1 1 } } }
	p_0510_0_out { ap_fifo {  { p_0510_0_out_din fifo_data 1 5 }  { p_0510_0_out_full_n fifo_status 0 1 }  { p_0510_0_out_write fifo_update 1 1 } } }
}
