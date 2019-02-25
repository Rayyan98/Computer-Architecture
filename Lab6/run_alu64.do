vlog alu64behav.v tb_ALU64.v
vsim -novopt work.tb_ALU64
view wave
add wave sim:/tb_ALU64/*
run 170 ns