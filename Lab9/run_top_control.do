vlib work
vlog top_control.v Control_Unit.v ALU_Control.v tb_top_control.v
vsim -novopt work.tb_top_control
view wave
add wave sim:/tb_top_control/tc/*
run 40 ns