vlib work
vlog ALU_Control.v tb_ALU__Control.v
vsim -novopt work.tb_ALU_Control
view wave
add wave sim:/tb_ALU_Control/*
run 30 ns