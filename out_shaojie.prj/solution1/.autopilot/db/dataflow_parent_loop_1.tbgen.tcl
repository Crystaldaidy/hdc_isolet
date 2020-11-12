set moduleName dataflow_parent_loop_1
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {dataflow_parent_loop.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ hcl_trainLabels_V int 32 regular {array 6238 { 1 3 } 1 1 }  }
	{ hcl_in_train_V int 64 regular {array 973128 { 1 3 } 3 1 }  }
	{ compute1_V int 32 regular {array 26 { 0 3 } 0 1 }  }
	{ hcl_rdv3_V int 64 regular {array 259584 { 1 3 } 1 1 }  }
	{ prototype_V int 64 regular {array 4056 { 0 3 } 0 1 }  }
	{ prototypeCounter_V int 32 regular {array 259584 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "hcl_trainLabels_V", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "hcl_in_train_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "compute1_V", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "hcl_rdv3_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "prototype_V", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "prototypeCounter_V", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 67
set portList { 
	{ hcl_trainLabels_V_address0 sc_out sc_lv 13 signal 0 } 
	{ hcl_trainLabels_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ hcl_trainLabels_V_d0 sc_out sc_lv 32 signal 0 } 
	{ hcl_trainLabels_V_q0 sc_in sc_lv 32 signal 0 } 
	{ hcl_trainLabels_V_we0 sc_out sc_logic 1 signal 0 } 
	{ hcl_trainLabels_V_address1 sc_out sc_lv 13 signal 0 } 
	{ hcl_trainLabels_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ hcl_trainLabels_V_d1 sc_out sc_lv 32 signal 0 } 
	{ hcl_trainLabels_V_q1 sc_in sc_lv 32 signal 0 } 
	{ hcl_trainLabels_V_we1 sc_out sc_logic 1 signal 0 } 
	{ hcl_in_train_V_address0 sc_out sc_lv 20 signal 1 } 
	{ hcl_in_train_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ hcl_in_train_V_d0 sc_out sc_lv 64 signal 1 } 
	{ hcl_in_train_V_q0 sc_in sc_lv 64 signal 1 } 
	{ hcl_in_train_V_we0 sc_out sc_logic 1 signal 1 } 
	{ hcl_in_train_V_address1 sc_out sc_lv 20 signal 1 } 
	{ hcl_in_train_V_ce1 sc_out sc_logic 1 signal 1 } 
	{ hcl_in_train_V_d1 sc_out sc_lv 64 signal 1 } 
	{ hcl_in_train_V_q1 sc_in sc_lv 64 signal 1 } 
	{ hcl_in_train_V_we1 sc_out sc_logic 1 signal 1 } 
	{ compute1_V_address0 sc_out sc_lv 5 signal 2 } 
	{ compute1_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ compute1_V_d0 sc_out sc_lv 32 signal 2 } 
	{ compute1_V_q0 sc_in sc_lv 32 signal 2 } 
	{ compute1_V_we0 sc_out sc_logic 1 signal 2 } 
	{ compute1_V_address1 sc_out sc_lv 5 signal 2 } 
	{ compute1_V_ce1 sc_out sc_logic 1 signal 2 } 
	{ compute1_V_d1 sc_out sc_lv 32 signal 2 } 
	{ compute1_V_q1 sc_in sc_lv 32 signal 2 } 
	{ compute1_V_we1 sc_out sc_logic 1 signal 2 } 
	{ hcl_rdv3_V_address0 sc_out sc_lv 18 signal 3 } 
	{ hcl_rdv3_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ hcl_rdv3_V_d0 sc_out sc_lv 64 signal 3 } 
	{ hcl_rdv3_V_q0 sc_in sc_lv 64 signal 3 } 
	{ hcl_rdv3_V_we0 sc_out sc_logic 1 signal 3 } 
	{ hcl_rdv3_V_address1 sc_out sc_lv 18 signal 3 } 
	{ hcl_rdv3_V_ce1 sc_out sc_logic 1 signal 3 } 
	{ hcl_rdv3_V_d1 sc_out sc_lv 64 signal 3 } 
	{ hcl_rdv3_V_q1 sc_in sc_lv 64 signal 3 } 
	{ hcl_rdv3_V_we1 sc_out sc_logic 1 signal 3 } 
	{ prototype_V_address0 sc_out sc_lv 12 signal 4 } 
	{ prototype_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ prototype_V_d0 sc_out sc_lv 64 signal 4 } 
	{ prototype_V_q0 sc_in sc_lv 64 signal 4 } 
	{ prototype_V_we0 sc_out sc_logic 1 signal 4 } 
	{ prototype_V_address1 sc_out sc_lv 12 signal 4 } 
	{ prototype_V_ce1 sc_out sc_logic 1 signal 4 } 
	{ prototype_V_d1 sc_out sc_lv 64 signal 4 } 
	{ prototype_V_q1 sc_in sc_lv 64 signal 4 } 
	{ prototype_V_we1 sc_out sc_logic 1 signal 4 } 
	{ prototypeCounter_V_address0 sc_out sc_lv 18 signal 5 } 
	{ prototypeCounter_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ prototypeCounter_V_d0 sc_out sc_lv 32 signal 5 } 
	{ prototypeCounter_V_q0 sc_in sc_lv 32 signal 5 } 
	{ prototypeCounter_V_we0 sc_out sc_logic 1 signal 5 } 
	{ prototypeCounter_V_address1 sc_out sc_lv 18 signal 5 } 
	{ prototypeCounter_V_ce1 sc_out sc_logic 1 signal 5 } 
	{ prototypeCounter_V_d1 sc_out sc_lv 32 signal 5 } 
	{ prototypeCounter_V_q1 sc_in sc_lv 32 signal 5 } 
	{ prototypeCounter_V_we1 sc_out sc_logic 1 signal 5 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "hcl_trainLabels_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "address0" }} , 
 	{ "name": "hcl_trainLabels_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "ce0" }} , 
 	{ "name": "hcl_trainLabels_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "d0" }} , 
 	{ "name": "hcl_trainLabels_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "q0" }} , 
 	{ "name": "hcl_trainLabels_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "we0" }} , 
 	{ "name": "hcl_trainLabels_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "address1" }} , 
 	{ "name": "hcl_trainLabels_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "ce1" }} , 
 	{ "name": "hcl_trainLabels_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "d1" }} , 
 	{ "name": "hcl_trainLabels_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "q1" }} , 
 	{ "name": "hcl_trainLabels_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "we1" }} , 
 	{ "name": "hcl_in_train_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "address0" }} , 
 	{ "name": "hcl_in_train_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "ce0" }} , 
 	{ "name": "hcl_in_train_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "d0" }} , 
 	{ "name": "hcl_in_train_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "q0" }} , 
 	{ "name": "hcl_in_train_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "we0" }} , 
 	{ "name": "hcl_in_train_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "address1" }} , 
 	{ "name": "hcl_in_train_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "ce1" }} , 
 	{ "name": "hcl_in_train_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "d1" }} , 
 	{ "name": "hcl_in_train_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "q1" }} , 
 	{ "name": "hcl_in_train_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "we1" }} , 
 	{ "name": "compute1_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "compute1_V", "role": "address0" }} , 
 	{ "name": "compute1_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute1_V", "role": "ce0" }} , 
 	{ "name": "compute1_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compute1_V", "role": "d0" }} , 
 	{ "name": "compute1_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compute1_V", "role": "q0" }} , 
 	{ "name": "compute1_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute1_V", "role": "we0" }} , 
 	{ "name": "compute1_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "compute1_V", "role": "address1" }} , 
 	{ "name": "compute1_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute1_V", "role": "ce1" }} , 
 	{ "name": "compute1_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compute1_V", "role": "d1" }} , 
 	{ "name": "compute1_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compute1_V", "role": "q1" }} , 
 	{ "name": "compute1_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compute1_V", "role": "we1" }} , 
 	{ "name": "hcl_rdv3_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "address0" }} , 
 	{ "name": "hcl_rdv3_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "ce0" }} , 
 	{ "name": "hcl_rdv3_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "d0" }} , 
 	{ "name": "hcl_rdv3_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "q0" }} , 
 	{ "name": "hcl_rdv3_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "we0" }} , 
 	{ "name": "hcl_rdv3_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "address1" }} , 
 	{ "name": "hcl_rdv3_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "ce1" }} , 
 	{ "name": "hcl_rdv3_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "d1" }} , 
 	{ "name": "hcl_rdv3_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "q1" }} , 
 	{ "name": "hcl_rdv3_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "we1" }} , 
 	{ "name": "prototype_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "prototype_V", "role": "address0" }} , 
 	{ "name": "prototype_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototype_V", "role": "ce0" }} , 
 	{ "name": "prototype_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "prototype_V", "role": "d0" }} , 
 	{ "name": "prototype_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "prototype_V", "role": "q0" }} , 
 	{ "name": "prototype_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototype_V", "role": "we0" }} , 
 	{ "name": "prototype_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "prototype_V", "role": "address1" }} , 
 	{ "name": "prototype_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototype_V", "role": "ce1" }} , 
 	{ "name": "prototype_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "prototype_V", "role": "d1" }} , 
 	{ "name": "prototype_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "prototype_V", "role": "q1" }} , 
 	{ "name": "prototype_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototype_V", "role": "we1" }} , 
 	{ "name": "prototypeCounter_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "address0" }} , 
 	{ "name": "prototypeCounter_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "ce0" }} , 
 	{ "name": "prototypeCounter_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "d0" }} , 
 	{ "name": "prototypeCounter_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "q0" }} , 
 	{ "name": "prototypeCounter_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "we0" }} , 
 	{ "name": "prototypeCounter_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "address1" }} , 
 	{ "name": "prototypeCounter_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "ce1" }} , 
 	{ "name": "prototypeCounter_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "d1" }} , 
 	{ "name": "prototypeCounter_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "q1" }} , 
 	{ "name": "prototypeCounter_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prototypeCounter_V", "role": "we1" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "dataflow_parent_loop_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1624042341", "EstimateLatencyMax" : "1625988597",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_lea_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_lea_U0"}],
		"Port" : [
			{"Name" : "hcl_trainLabels_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "hcl_trainLabels_V"}]},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "hcl_in_train_V"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "compute1_V"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "hcl_rdv3_V"}]},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "prototype_V"}]},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "prototypeCounter_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0", "Parent" : "0", "Child" : ["2", "3", "4", "9", "10"],
		"CDFG" : "dataflow_in_loop_lea",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65282264", "EstimateLatencyMax" : "67228520",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "3", "Name" : "match_x4_proc_U0", "ReadyCount" : "match_x4_proc_U0_ap_ready_count"},
			{"ID" : "4", "Name" : "i2_proc_U0", "ReadyCount" : "i2_proc_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "4", "Name" : "i2_proc_U0"}],
		"Port" : [
			{"Name" : "hcl_trainLabels_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "match_x4_proc_U0", "Port" : "hcl_trainLabels_V"}]},
			{"Name" : "p_0510_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "match_x4_proc_U0", "Port" : "hcl_in_train_V"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "i2_proc_U0", "Port" : "compute1_V"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "i2_proc_U0", "Port" : "hcl_rdv3_V"}]},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "i2_proc_U0", "Port" : "prototype_V"}]},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "i2_proc_U0", "Port" : "prototypeCounter_V"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.compute2_V_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.match_x4_proc_U0", "Parent" : "1",
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
			{"Name" : "compute2_V1", "Type" : "Memory", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "2"},
			{"Name" : "p_0510_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "match2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "match2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_0510_0_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "p_0510_0_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.i2_proc_U0", "Parent" : "1", "Child" : ["5", "6", "7", "8"],
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
			{"Name" : "compute2_V1", "Type" : "Memory", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "2"},
			{"Name" : "p_0510_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "p_0510_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "match2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "match2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.i2_proc_U0.result_V_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.i2_proc_U0.sum1_V_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.i2_proc_U0.test_mul_mul_5ns_bkb_U7", "Parent" : "4"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.i2_proc_U0.test_mul_mul_5ns_cud_U8", "Parent" : "4"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.match2_channel_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lea_U0.p_0510_0_c_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	dataflow_parent_loop_1 {
		hcl_trainLabels_V {Type I LastRead 2 FirstWrite -1}
		hcl_in_train_V {Type I LastRead 3 FirstWrite -1}
		compute1_V {Type O LastRead -1 FirstWrite 4}
		hcl_rdv3_V {Type I LastRead 5 FirstWrite -1}
		prototype_V {Type O LastRead -1 FirstWrite 7}
		prototypeCounter_V {Type O LastRead -1 FirstWrite 7}}
	dataflow_in_loop_lea {
		hcl_trainLabels_V {Type I LastRead 2 FirstWrite -1}
		p_0510_0 {Type I LastRead 0 FirstWrite -1}
		hcl_in_train_V {Type I LastRead 3 FirstWrite -1}
		compute1_V {Type O LastRead -1 FirstWrite 4}
		hcl_rdv3_V {Type I LastRead 5 FirstWrite -1}
		prototype_V {Type O LastRead -1 FirstWrite 7}
		prototypeCounter_V {Type O LastRead -1 FirstWrite 7}}
	match_x4_proc {
		hcl_trainLabels_V {Type I LastRead 2 FirstWrite -1}
		compute2_V1 {Type O LastRead -1 FirstWrite 6}
		p_0510_0 {Type I LastRead 0 FirstWrite -1}
		hcl_in_train_V {Type I LastRead 3 FirstWrite -1}
		match2 {Type O LastRead -1 FirstWrite 3}
		p_0510_0_out {Type O LastRead -1 FirstWrite 0}}
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
	{"Name" : "Latency", "Min" : "1624042341", "Max" : "1625988597"}
	, {"Name" : "Interval", "Min" : "1624042341", "Max" : "1625988597"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	hcl_trainLabels_V { ap_memory {  { hcl_trainLabels_V_address0 mem_address 1 13 }  { hcl_trainLabels_V_ce0 mem_ce 1 1 }  { hcl_trainLabels_V_d0 mem_din 1 32 }  { hcl_trainLabels_V_q0 mem_dout 0 32 }  { hcl_trainLabels_V_we0 mem_we 1 1 }  { hcl_trainLabels_V_address1 mem_address 1 13 }  { hcl_trainLabels_V_ce1 mem_ce 1 1 }  { hcl_trainLabels_V_d1 mem_din 1 32 }  { hcl_trainLabels_V_q1 mem_dout 0 32 }  { hcl_trainLabels_V_we1 mem_we 1 1 } } }
	hcl_in_train_V { ap_memory {  { hcl_in_train_V_address0 mem_address 1 20 }  { hcl_in_train_V_ce0 mem_ce 1 1 }  { hcl_in_train_V_d0 mem_din 1 64 }  { hcl_in_train_V_q0 mem_dout 0 64 }  { hcl_in_train_V_we0 mem_we 1 1 }  { hcl_in_train_V_address1 mem_address 1 20 }  { hcl_in_train_V_ce1 mem_ce 1 1 }  { hcl_in_train_V_d1 mem_din 1 64 }  { hcl_in_train_V_q1 mem_dout 0 64 }  { hcl_in_train_V_we1 mem_we 1 1 } } }
	compute1_V { ap_memory {  { compute1_V_address0 mem_address 1 5 }  { compute1_V_ce0 mem_ce 1 1 }  { compute1_V_d0 mem_din 1 32 }  { compute1_V_q0 mem_dout 0 32 }  { compute1_V_we0 mem_we 1 1 }  { compute1_V_address1 mem_address 1 5 }  { compute1_V_ce1 mem_ce 1 1 }  { compute1_V_d1 mem_din 1 32 }  { compute1_V_q1 mem_dout 0 32 }  { compute1_V_we1 mem_we 1 1 } } }
	hcl_rdv3_V { ap_memory {  { hcl_rdv3_V_address0 mem_address 1 18 }  { hcl_rdv3_V_ce0 mem_ce 1 1 }  { hcl_rdv3_V_d0 mem_din 1 64 }  { hcl_rdv3_V_q0 mem_dout 0 64 }  { hcl_rdv3_V_we0 mem_we 1 1 }  { hcl_rdv3_V_address1 mem_address 1 18 }  { hcl_rdv3_V_ce1 mem_ce 1 1 }  { hcl_rdv3_V_d1 mem_din 1 64 }  { hcl_rdv3_V_q1 mem_dout 0 64 }  { hcl_rdv3_V_we1 mem_we 1 1 } } }
	prototype_V { ap_memory {  { prototype_V_address0 mem_address 1 12 }  { prototype_V_ce0 mem_ce 1 1 }  { prototype_V_d0 mem_din 1 64 }  { prototype_V_q0 mem_dout 0 64 }  { prototype_V_we0 mem_we 1 1 }  { prototype_V_address1 mem_address 1 12 }  { prototype_V_ce1 mem_ce 1 1 }  { prototype_V_d1 mem_din 1 64 }  { prototype_V_q1 mem_dout 0 64 }  { prototype_V_we1 mem_we 1 1 } } }
	prototypeCounter_V { ap_memory {  { prototypeCounter_V_address0 mem_address 1 18 }  { prototypeCounter_V_ce0 mem_ce 1 1 }  { prototypeCounter_V_d0 mem_din 1 32 }  { prototypeCounter_V_q0 mem_dout 0 32 }  { prototypeCounter_V_we0 mem_we 1 1 }  { prototypeCounter_V_address1 mem_address 1 18 }  { prototypeCounter_V_ce1 mem_ce 1 1 }  { prototypeCounter_V_d1 mem_din 1 32 }  { prototypeCounter_V_q1 mem_dout 0 32 }  { prototypeCounter_V_we1 mem_we 1 1 } } }
}
