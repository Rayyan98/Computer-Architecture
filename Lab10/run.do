vlib work
vlog Adder.v ALU_Control.v alu64behav.v Control_Unit.v Data_Memory.v imm_data.v Instruction_Memory.v instruction_parser.v Mux.v Program_Counter.v registerFile.v RISC_V_Processor.v tb.v
vsim -novopt work.tb
view wave
add wave -r /*
run 34 ns