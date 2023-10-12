transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/Datamemory.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/ALUnitHW.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/Mux2input.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/RegFiles.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/InstructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/pc.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/Datapath.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/Datapath_tb.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/imm_Gen.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/Decoder3by3.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/adder_32.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/BranchSel.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ Copy\ -\ Copy {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - Copy - Copy/Microprogramming.sv}

