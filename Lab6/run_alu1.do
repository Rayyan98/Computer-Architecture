vlog alu.v tb_ALU1.v
vsim -novopt work.tb_ALU1
add wave sim:/tb_ALU1/*
run 600 ns