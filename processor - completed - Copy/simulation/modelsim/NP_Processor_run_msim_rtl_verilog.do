transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/Datamemory.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/ALUnitHW.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/Mux2input.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/RegFiles.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/InstructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/pc.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/Datapath.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/Datapath_tb.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/imm_Gen.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/Decoder3by3.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/adder_32.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/BranchSel.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed - Copy/Microprogramming.sv}

