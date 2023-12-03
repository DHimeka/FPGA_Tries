transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ 1 {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed 1/Binary_to_BCD.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor\ -\ completed\ 1 {C:/Users/DELL/Desktop/Processor/FPGA_Tries/processor - completed 1/testbench.sv}

