vlib work
vlog tb_top.v top.v registerFile.v instruction_parser.v
vsim -novopt work.tb_top
view wave
add wave \
{sim:/tb_top/instruction }
add wave \
{sim:/tb_top/ReadData1 }
add wave \
{sim:/tb_top/ReadData2 }
run 30 ns