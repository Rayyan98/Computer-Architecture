vlog Instruction_Memory.v tb_Instruction_Memory.v
vsim -novopt work.tb_Instruction_Memory
view wave
add wave sim:/tb_Instruction_Memory/*
run 25 ns