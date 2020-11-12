set moduleName test
set isTopModule 1
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
set C_modelName {test}
set C_modelType { void 0 }
set C_modelArgList {
	{ hcl_rdv3_V int 64 regular {array 259584 { 1 3 } 1 1 }  }
	{ hcl_trainLabels_V int 32 regular {array 6238 { 1 3 } 1 1 }  }
	{ hcl_in_train_V int 64 regular {array 973128 { 1 3 } 3 1 }  }
	{ hcl_in_test_V int 64 regular {array 243204 { 1 3 } 1 1 }  }
	{ hcl_testLabels_V int 32 unused {array 1559 { } 0 1 }  }
	{ hcl_epoch_V int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "hcl_rdv3_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "hcl_rdv3.V","cData": "int64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 25,"step" : 1},{"low" : 0,"up" : 9983,"step" : 1}]}]}]} , 
 	{ "Name" : "hcl_trainLabels_V", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "hcl_trainLabels.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 6237,"step" : 1}]}]}]} , 
 	{ "Name" : "hcl_in_train_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "hcl_in_train.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 6237,"step" : 1},{"low" : 0,"up" : 155,"step" : 1}]}]}]} , 
 	{ "Name" : "hcl_in_test_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "hcl_in_test.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 1558,"step" : 1},{"low" : 0,"up" : 155,"step" : 1}]}]}]} , 
 	{ "Name" : "hcl_testLabels_V", "interface" : "memory", "bitwidth" : 32, "direction" : "NONE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "hcl_testLabels.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1558,"step" : 1}]}]}]} , 
 	{ "Name" : "hcl_epoch_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "hcl_epoch.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ hcl_rdv3_V_address0 sc_out sc_lv 18 signal 0 } 
	{ hcl_rdv3_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ hcl_rdv3_V_q0 sc_in sc_lv 64 signal 0 } 
	{ hcl_trainLabels_V_address0 sc_out sc_lv 13 signal 1 } 
	{ hcl_trainLabels_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ hcl_trainLabels_V_q0 sc_in sc_lv 32 signal 1 } 
	{ hcl_in_train_V_address0 sc_out sc_lv 20 signal 2 } 
	{ hcl_in_train_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ hcl_in_train_V_q0 sc_in sc_lv 64 signal 2 } 
	{ hcl_in_test_V_address0 sc_out sc_lv 18 signal 3 } 
	{ hcl_in_test_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ hcl_in_test_V_q0 sc_in sc_lv 64 signal 3 } 
	{ hcl_testLabels_V_address0 sc_out sc_lv 11 signal 4 } 
	{ hcl_testLabels_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ hcl_testLabels_V_we0 sc_out sc_logic 1 signal 4 } 
	{ hcl_testLabels_V_d0 sc_out sc_lv 32 signal 4 } 
	{ hcl_testLabels_V_q0 sc_in sc_lv 32 signal 4 } 
	{ hcl_testLabels_V_address1 sc_out sc_lv 11 signal 4 } 
	{ hcl_testLabels_V_ce1 sc_out sc_logic 1 signal 4 } 
	{ hcl_testLabels_V_we1 sc_out sc_logic 1 signal 4 } 
	{ hcl_testLabels_V_d1 sc_out sc_lv 32 signal 4 } 
	{ hcl_testLabels_V_q1 sc_in sc_lv 32 signal 4 } 
	{ hcl_epoch_V sc_in sc_lv 32 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "hcl_rdv3_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "address0" }} , 
 	{ "name": "hcl_rdv3_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "ce0" }} , 
 	{ "name": "hcl_rdv3_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_rdv3_V", "role": "q0" }} , 
 	{ "name": "hcl_trainLabels_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "address0" }} , 
 	{ "name": "hcl_trainLabels_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "ce0" }} , 
 	{ "name": "hcl_trainLabels_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_trainLabels_V", "role": "q0" }} , 
 	{ "name": "hcl_in_train_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "address0" }} , 
 	{ "name": "hcl_in_train_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "ce0" }} , 
 	{ "name": "hcl_in_train_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_train_V", "role": "q0" }} , 
 	{ "name": "hcl_in_test_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hcl_in_test_V", "role": "address0" }} , 
 	{ "name": "hcl_in_test_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_in_test_V", "role": "ce0" }} , 
 	{ "name": "hcl_in_test_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "hcl_in_test_V", "role": "q0" }} , 
 	{ "name": "hcl_testLabels_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "address0" }} , 
 	{ "name": "hcl_testLabels_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "ce0" }} , 
 	{ "name": "hcl_testLabels_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "we0" }} , 
 	{ "name": "hcl_testLabels_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "d0" }} , 
 	{ "name": "hcl_testLabels_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "q0" }} , 
 	{ "name": "hcl_testLabels_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "address1" }} , 
 	{ "name": "hcl_testLabels_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "ce1" }} , 
 	{ "name": "hcl_testLabels_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "we1" }} , 
 	{ "name": "hcl_testLabels_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "d1" }} , 
 	{ "name": "hcl_testLabels_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_testLabels_V", "role": "q1" }} , 
 	{ "name": "hcl_epoch_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hcl_epoch_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "test",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state6", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_dataflow_parent_loop_1_fu_1289"}],
		"Port" : [
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_dataflow_parent_loop_1_fu_1289", "Port" : "hcl_rdv3_V"}]},
			{"Name" : "hcl_trainLabels_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_dataflow_parent_loop_1_fu_1289", "Port" : "hcl_trainLabels_V"}]},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_dataflow_parent_loop_1_fu_1289", "Port" : "hcl_in_train_V"}]},
			{"Name" : "hcl_in_test_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "hcl_testLabels_V", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "hcl_epoch_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.prototype_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.prototypeCounter_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.compute1_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.distance1_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.distance1_V_18_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.distance_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pre_dist_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hamming_dist_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.distance1_V_19_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.distance1_V_20_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289", "Parent" : "0", "Child" : ["12"],
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
			{"ID" : "12", "Name" : "dataflow_in_loop_lea_U0"}],
		"OutputProcess" : [
			{"ID" : "12", "Name" : "dataflow_in_loop_lea_U0"}],
		"Port" : [
			{"Name" : "hcl_trainLabels_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "hcl_trainLabels_V"}]},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "hcl_in_train_V"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "compute1_V"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "hcl_rdv3_V"}]},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "prototype_V"}]},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "dataflow_in_loop_lea_U0", "Port" : "prototypeCounter_V"}]}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0", "Parent" : "11", "Child" : ["13", "14", "15", "20", "21"],
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
			{"ID" : "14", "Name" : "match_x4_proc_U0", "ReadyCount" : "match_x4_proc_U0_ap_ready_count"},
			{"ID" : "15", "Name" : "i2_proc_U0", "ReadyCount" : "i2_proc_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "15", "Name" : "i2_proc_U0"}],
		"Port" : [
			{"Name" : "hcl_trainLabels_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "match_x4_proc_U0", "Port" : "hcl_trainLabels_V"}]},
			{"Name" : "p_0510_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "match_x4_proc_U0", "Port" : "hcl_in_train_V"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "i2_proc_U0", "Port" : "compute1_V"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "i2_proc_U0", "Port" : "hcl_rdv3_V"}]},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "i2_proc_U0", "Port" : "prototype_V"}]},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "i2_proc_U0", "Port" : "prototypeCounter_V"}]}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.compute2_V_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.match_x4_proc_U0", "Parent" : "12",
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
			{"Name" : "compute2_V1", "Type" : "Memory", "Direction" : "O", "DependentProc" : "15", "DependentChan" : "13"},
			{"Name" : "p_0510_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "hcl_in_train_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "match2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "15", "DependentChan" : "20",
				"BlockSignal" : [
					{"Name" : "match2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_0510_0_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "15", "DependentChan" : "21",
				"BlockSignal" : [
					{"Name" : "p_0510_0_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.i2_proc_U0", "Parent" : "12", "Child" : ["16", "17", "18", "19"],
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
			{"Name" : "compute2_V1", "Type" : "Memory", "Direction" : "I", "DependentProc" : "14", "DependentChan" : "13"},
			{"Name" : "p_0510_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "14", "DependentChan" : "21",
				"BlockSignal" : [
					{"Name" : "p_0510_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "compute1_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "match2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "14", "DependentChan" : "20",
				"BlockSignal" : [
					{"Name" : "match2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "hcl_rdv3_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "prototype_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "prototypeCounter_V", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.i2_proc_U0.result_V_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.i2_proc_U0.sum1_V_U", "Parent" : "15"},
	{"ID" : "18", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.i2_proc_U0.test_mul_mul_5ns_bkb_U7", "Parent" : "15"},
	{"ID" : "19", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.i2_proc_U0.test_mul_mul_5ns_cud_U8", "Parent" : "15"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.match2_channel_U", "Parent" : "12"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_1_fu_1289.dataflow_in_loop_lea_U0.p_0510_0_c_U", "Parent" : "12"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_srem_34s_15nfYi_U36", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_srem_34s_15nfYi_U37", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_mul_mul_9ns_g8j_U38", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_mul_mul_9ns_g8j_U39", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_mac_muladd_1hbi_U40", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.test_mac_muladd_1hbi_U41", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	test {
		hcl_rdv3_V {Type I LastRead 5 FirstWrite -1}
		hcl_trainLabels_V {Type I LastRead 14 FirstWrite -1}
		hcl_in_train_V {Type I LastRead 21 FirstWrite -1}
		hcl_in_test_V {Type I LastRead 18 FirstWrite -1}
		hcl_testLabels_V {Type X LastRead -1 FirstWrite -1}
		hcl_epoch_V {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	hcl_rdv3_V { ap_memory {  { hcl_rdv3_V_address0 mem_address 1 18 }  { hcl_rdv3_V_ce0 mem_ce 1 1 }  { hcl_rdv3_V_q0 mem_dout 0 64 } } }
	hcl_trainLabels_V { ap_memory {  { hcl_trainLabels_V_address0 mem_address 1 13 }  { hcl_trainLabels_V_ce0 mem_ce 1 1 }  { hcl_trainLabels_V_q0 mem_dout 0 32 } } }
	hcl_in_train_V { ap_memory {  { hcl_in_train_V_address0 mem_address 1 20 }  { hcl_in_train_V_ce0 mem_ce 1 1 }  { hcl_in_train_V_q0 mem_dout 0 64 } } }
	hcl_in_test_V { ap_memory {  { hcl_in_test_V_address0 mem_address 1 18 }  { hcl_in_test_V_ce0 mem_ce 1 1 }  { hcl_in_test_V_q0 mem_dout 0 64 } } }
	hcl_testLabels_V { ap_memory {  { hcl_testLabels_V_address0 mem_address 1 11 }  { hcl_testLabels_V_ce0 mem_ce 1 1 }  { hcl_testLabels_V_we0 mem_we 1 1 }  { hcl_testLabels_V_d0 mem_din 1 32 }  { hcl_testLabels_V_q0 mem_dout 0 32 }  { hcl_testLabels_V_address1 MemPortADDR2 1 11 }  { hcl_testLabels_V_ce1 MemPortCE2 1 1 }  { hcl_testLabels_V_we1 MemPortWE2 1 1 }  { hcl_testLabels_V_d1 MemPortDIN2 1 32 }  { hcl_testLabels_V_q1 MemPortDOUT2 0 32 } } }
	hcl_epoch_V { ap_none {  { hcl_epoch_V in_data 0 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
	{ hcl_in_train_V 3 }
}
