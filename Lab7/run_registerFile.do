vlog registerFile.v tb_registerFile.v
vsim -novopt work.tb_registerFile
view wave
add wave sim:/tb_registerFile/rf1/*
run 50 ns