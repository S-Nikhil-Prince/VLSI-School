vlib work
vlog dut.v +acc 
vlog tb.v +acc
vsim work.tb_calculator
add wave -r \*
run -all
