vlog instruction_parser.v tb_parser.v
vsim -novopt work.tb_parser
view wave
add wave -r /*
run 1000 ns