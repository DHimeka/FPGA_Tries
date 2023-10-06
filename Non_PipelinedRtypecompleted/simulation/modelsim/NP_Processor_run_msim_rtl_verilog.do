transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/ALUnitHW.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/RegFiles.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/InstructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/pc.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/Datapath.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/Datapath_tb.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor {C:/Users/DELL/Desktop/Processor/ControlUnit.sv}

