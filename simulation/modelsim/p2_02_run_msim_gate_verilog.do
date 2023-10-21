transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/maxii_ver
vmap maxii_ver ./verilog_libs/maxii_ver
vlog -vlog01compat -work maxii_ver {p:/quartus/quartus/eda/sim_lib/maxii_atoms.v}

if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {p2_02.vo}

vlog -vlog01compat -work work +incdir+D:/Documents/ProjectsQuartus/MI2023.2\ P2\ TESTE02 {D:/Documents/ProjectsQuartus/MI2023.2 P2 TESTE02/main_module.v}

vsim -t 1ps -L maxii_ver -L gate_work -L work -voptargs="+acc"  main_module

add wave *
view structure
view signals
run -all
