vlog imm_data.v tb_extractor.v
vsim -novopt work.tb_extractor
view wave
add wave -r /*
run 1200 ns