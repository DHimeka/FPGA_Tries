## Generated SDC file "NP_Processor.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Sun Oct 15 22:21:12 2023"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk1} -period 10.000 -waveform { 0.000 5.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {clk1}]  3.000 [get_ports {reset}]
set_input_delay -add_delay -min -clock [get_clocks {clk1}]  2.000 [get_ports {reset}]
set_input_delay -add_delay -max -clock [get_clocks {clk1}]  3.000 [get_ports {sw[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk1}]  2.000 [get_ports {sw[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk1}]  3.000 [get_ports {sw[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk1}]  2.000 [get_ports {sw[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk1}]  3.000 [get_ports {sw[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk1}]  2.000 [get_ports {sw[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk1}]  3.000 [get_ports {sw[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk1}]  2.000 [get_ports {sw[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk1}]  3.000 [get_ports {sw[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk1}]  2.000 [get_ports {sw[4]}]


#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

