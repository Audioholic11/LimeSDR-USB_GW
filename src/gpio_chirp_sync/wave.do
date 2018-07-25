onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TestBench /gpio_chirp_sync_top_tb/r_clk
add wave -noupdate -expand -group TestBench /gpio_chirp_sync_top_tb/r_reset_n
add wave -noupdate -expand -group TestBench /gpio_chirp_sync_top_tb/r_chirp_sig
add wave -noupdate -expand -group TestBench -radix decimal /gpio_chirp_sync_top_tb/w_sync_period
add wave -noupdate -expand -group TestBench /gpio_chirp_sync_top_tb/w_chirp_trig
add wave -noupdate -expand -group Top /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/reset_n
add wave -noupdate -expand -group Top -radix decimal /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/inst5_q
add wave -noupdate -expand -group Top -radix decimal /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/inst5_q_delay
add wave -noupdate -expand -group FSM /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/RSET
add wave -noupdate -expand -group FSM /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/CLK
add wave -noupdate -expand -group FSM /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/SIG
add wave -noupdate -expand -group FSM /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/L
add wave -noupdate -expand -group FSM /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/E
add wave -noupdate -expand -group FSM /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/TRIG
add wave -noupdate -expand -group FSM -radix unsigned /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/y
add wave -noupdate -expand -group FSM -radix unsigned /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/gpio_sync_FMS_inst0/Y
add wave -noupdate -expand -group lpm_counter /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/smpl_cnt_inst5/lpm_cnt_inst_inst0/clk
add wave -noupdate -expand -group lpm_counter /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/smpl_cnt_inst5/lpm_cnt_inst_inst0/reset_n
add wave -noupdate -expand -group lpm_counter /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/smpl_cnt_inst5/lpm_cnt_inst_inst0/sclr
add wave -noupdate -expand -group lpm_counter /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/smpl_cnt_inst5/lpm_cnt_inst_inst0/cnt_en
add wave -noupdate -expand -group lpm_counter -radix decimal /gpio_chirp_sync_top_tb/gpio_chirp_sync_top_INST/smpl_cnt_inst5/lpm_cnt_inst_inst0/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35191282 ps} 0} {{Cursor 2} {24464904 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 658
configure wave -valuecolwidth 56
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {34884683 ps} {35439919 ps}
