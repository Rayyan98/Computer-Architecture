vlog alu.v alu6.v tb_ALU6.v
vsim -novopt work.tb_ALU6
view wave
add wave sim:/tb_ALU6/*
run 500 ns