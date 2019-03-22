vlib work
vlog Control_Unit.v tb_Control_Unit.v
vsim -novopt work.tb_Control_Unit
view wave
add wave sim:/tb_Control_Unit/*
run 20 ns