vlib work
vlog design.v +acc 
vlog tb.v +acc 
vsim work.tb
add wave -r \*
run -all
