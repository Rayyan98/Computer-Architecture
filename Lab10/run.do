vlib work
vlog Adder.v ALU_Control.v alu64behav.v Control_Unit.v Data_Memory.v imm_data.v Instruction_Memory.v instruction_parser.v Mux.v Program_Counter.v registerFile.v RISC_V_Processor.v tb.v
vsim -novopt work.tb
view wave
add wave \
{sim:/tb/r1/rf1/clk }
add wave \
{sim:/tb/r1/pc1/PC_In }
add wave \
{sim:/tb/r1/pc1/PC_Out }
add wave \
{sim:/tb/r1/rf1/regs }
add wave \
{sim:/tb/r1/datam/regs }
run 75 ns