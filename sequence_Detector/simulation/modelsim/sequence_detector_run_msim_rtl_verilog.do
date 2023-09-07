transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/A/code {C:/Users/DELL/Desktop/A/code/tb_sequence_detector.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/A/code {C:/Users/DELL/Desktop/A/code/sequence_generator.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/A/code {C:/Users/DELL/Desktop/A/code/jk_ff.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/A/code {C:/Users/DELL/Desktop/A/code/sequence_detector.sv}

