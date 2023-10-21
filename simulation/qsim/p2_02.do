onerror {exit -code 1}
vlib work
vlog -work work p2_02.vo
vlog -work work Waveform.vwf.vt
vsim -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.tb_clock_divider_vlg_vec_tst
vcd file -direction p2_02.msim.vcd
vcd add -internal tb_clock_divider_vlg_vec_tst/*
vcd add -internal tb_clock_divider_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f



