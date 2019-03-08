vlib work
vlog tb_Instruction_Fetch.v Instruction_Fetch.v Instruction_Memory.v Adder.v Program_Counter.v
vsim -novopt work.tb_Instruction_Fetch
view wave
add wave sim:/tb_Instruction_Fetch/*
run 70 ns