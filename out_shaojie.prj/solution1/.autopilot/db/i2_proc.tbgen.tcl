set moduleName i2_proc
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
set C_modelName {i2_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ compute2_V1 int 1 regular {array 26 { 1 3 } 1 1 }  }
	{ p_0510_0 int 5 regular {fifo 0}  }
	{ compute1_V int 32 regular {array 26 { 0 3 } 0 1 }  }
	{ match2 int 64 regular {fifo 0 volatile }  }
	{ hcl_rdv3_V int 64 regular {array 259584 { 1 3 } 1 1 }  }
	{ prototype_V int 64 regular {array 4056 { 0 3 } 0 1 }  }
	{ prototypeCounter_V int 32 regular {array 259584 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "compute2_V1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "p_0510_0", "interface" : "fifo", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "compute1_V", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "match2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "hcl_rdv3_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "prototype_V", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "prototypeCounter_V", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ compute2_V1_address0 sc_out sc_lv 5 signal 0 } 
	{ compute2_V1_ce0 sc_out sc_logic 1 signal 0 } 
	{ compute2_V1_q0 sc_in sc_lv 1 signal 0 } 
	{ p_0510_0_dout sc_in sc_lv 5 signal 1 } 
	{ p_0510_0_empty_n sc_in sc_logic 1 signal 1 } 
	{ p_0510_0_read sc_out sc_logic 1 signal 1 } 
	{ compute1_V_address0 sc_out sc_lv 5 signal 2 } 
	{ compute1_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ compute1_V_we0 sc_out sc_logic 1 signal 2 } 
	{ compute1_V_d0 sc_out sc_lv 32 signal 2 } 
	{ match2_dout sc_in sc_lv 64 signal 3 } 
	{ match2_empty_n sc_in sc_logic 1 signal 3 } 
	{ match2_read sc_out sc_logic 1 signal 3 } 
	{ hcl_rdv3_V_address0 sc_out sc_lv 18 signal 4 } 
	{ hcl_rdv3_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ hcl_rdv3_V_q0 sc_in sc_lv 64 signal 4 } 
	{ prototype_V_address0 sc_out sc_lv 12 signal 5 } 
	{ prototype_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ prototype_V_we0 sc_out sc_lv 8 signal 5 } 
	{ prototype_V_d0 sc_out sc_lv 64 signal 5 } 
	{ prototypeCounter_V_address0 sc_out sc_lv 18 signal 6 } 
	{ prototypeCounter_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ prototypeCounter_V_we0 sc_out sc_logic 1 signal 6 } 
	{ prototypeCounter_V_d0 sc_out sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "compute2_V1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "compute2_V1", "role": "address0" }} , 
 	{ "name": "compute2_V1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute2_V1", "role": "ce0" }} , 
 	{ "name": "compute2_V1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "compute2_V1", "role": "q0" }} , 
 	{ "name": "p_0510_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "p_0510_0", "role": "dout" }} , 
 	{ "name": "p_0510_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_0510_0", "role": "empty_n" }} , 
 	{ "name": "p_0510_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_0510_0", "role": "read" }} , 
 	{ "name": "compute1_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "compute1_V", "role": "address0" }} , 
 	{ "name": "compute1_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute1_V", "role": "ce0" }} , 
 	{ "name": "compute1_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute1_V", "role": "we0" }} , 
 	{ "name": "compute1_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compute1_V", "role": "d0" }} , 
 	{ "name": "match2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "match2", "role": "dout" }} , 
 	{ "name": "match2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "match2", "role": "empty_n" }} , 
 	{ "name": "match2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "match2", "role": "read" }} , 
 	{ "name": "hcl_rdv3_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "address0" }} , 
 	{ "name": "hcl_rdv3_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "ce0" }} , 
 	{ "name": "hcl_rdv3_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "q0" }} , 
 	{ "name": "prototype_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "prototype_V", "role": "address0" }} , 
 	{ "name": "prototype_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototype_V", "role": "ce0" }} , 
 	{ "name": "prototype_V_we0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "prototype_V", "role": "we0" }} , 
 	{ "name": "prototype_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "prototype_V", "role": "d0" }} , 
 	{ "name": "prototypeCounter_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "address0" }} , 
 	{ "name": "prototypeCounter_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "ce0" }} , 
 	{ "name": "prototypeCounter_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "we0" }} , 
 	{ "name": "prototypeCounter_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "i2_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "62350402", "EstimateLatencyMax" : "62350402",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "compute2_V1", "Type" : "Memory", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_0510_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "p_0510_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "match2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "match2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.result_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sum1_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_mul_mul_5ns_bkb_U7", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_mul_mul_5ns_cud_U8", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	i2_proc {
		compute2_V1 {Type I LastRead 0 FirstWrite -1}
		p_0510_0 {Type I LastRead 0 FirstWrite -1}
		compute1_V {Type O LastRead -1 FirstWrite 4}
		match2 {Type I LastRead 4 FirstWrite -1}
		hcl_rdv3_V {Type I LastRead 5 FirstWrite -1}
		prototype_V {Type O LastRead -1 FirstWrite 7}
		prototypeCounter_V {Type O LastRead -1 FirstWrite 7}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "62350402", "Max" : "62350402"}
	, {"Name" : "Interval", "Min" : "62350402", "Max" : "62350402"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	compute2_V1 { ap_memory {  { compute2_V1_address0 mem_address 1 5 }  { compute2_V1_ce0 mem_ce 1 1 }  { compute2_V1_q0 mem_dout 0 1 } } }
	p_0510_0 { ap_fifo {  { p_0510_0_dout fifo_data 0 5 }  { p_0510_0_empty_n fifo_status 0 1 }  { p_0510_0_read fifo_update 1 1 } } }
	compute1_V { ap_memory {  { compute1_V_address0 mem_address 1 5 }  { compute1_V_ce0 mem_ce 1 1 }  { compute1_V_we0 mem_we 1 1 }  { compute1_V_d0 mem_din 1 32 } } }
	match2 { ap_fifo {  { match2_dout fifo_data 0 64 }  { match2_empty_n fifo_status 0 1 }  { match2_read fifo_update 1 1 } } }
	hcl_rdv3_V { ap_memory {  { hcl_rdv3_V_address0 mem_address 1 18 }  { hcl_rdv3_V_ce0 mem_ce 1 1 }  { hcl_rdv3_V_q0 mem_dout 0 64 } } }
	prototype_V { ap_memory {  { prototype_V_address0 mem_address 1 12 }  { prototype_V_ce0 mem_ce 1 1 }  { prototype_V_we0 mem_we 1 8 }  { prototype_V_d0 mem_din 1 64 } } }
	prototypeCounter_V { ap_memory {  { prototypeCounter_V_address0 mem_address 1 18 }  { prototypeCounter_V_ce0 mem_ce 1 1 }  { prototypeCounter_V_we0 mem_we 1 1 }  { prototypeCounter_V_d0 mem_din 1 32 } } }
}
