vlib work
vlog Data_Memory.v tb_Data_Memory.v
vsim -novopt work.tb_Data_Memory
view wave
add wave sim:/tb_Data_Memory/*
run 35 ns