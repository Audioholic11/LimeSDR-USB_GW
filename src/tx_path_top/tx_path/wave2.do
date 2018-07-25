onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tx_path_top /tx_path_top_tb/tx_path_top_inst0/reset_n
add wave -noupdate -expand -group tx_path_top -format Analog-Step -height 84 -max 624.0 -radix decimal /tx_path_top_tb/tx_path_top_inst0/rx_sample_nr
add wave -noupdate -expand -group tx_path_top -expand -group clk /tx_path_top_tb/tx_path_top_inst0/rx_sample_clk
add wave -noupdate -expand -group tx_path_top -expand -group clk /tx_path_top_tb/tx_path_top_inst0/iq_rdclk
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/in_pct_data_w
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/out_pct_data_w
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/pct_size_w
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/n_buff
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/iq_width
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/dev_family
add wave -noupdate -expand -group tx_path_top -group generic /tx_path_top_tb/tx_path_top_inst0/decomp_fifo_size
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/en
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/trxiqpulse
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/sample_width
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/mode
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/mimo_en
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/fidm
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/ddr_en
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/chirp_sync_en
add wave -noupdate -expand -group tx_path_top -group mode /tx_path_top_tb/tx_path_top_inst0/ch_en
add wave -noupdate -expand -group tx_path_top -expand -group pct_sync -radix decimal /tx_path_top_tb/tx_path_top_inst0/pct_sync_size
add wave -noupdate -expand -group tx_path_top -expand -group pct_sync /tx_path_top_tb/tx_path_top_inst0/pct_sync_pulse
add wave -noupdate -expand -group tx_path_top -expand -group pct_sync /tx_path_top_tb/tx_path_top_inst0/pct_sync_mode
add wave -noupdate -expand -group tx_path_top -expand -group pct_sync /tx_path_top_tb/tx_path_top_inst0/pct_sync_dis
add wave -noupdate -expand -group tx_path_top -group txant /tx_path_top_tb/tx_path_top_inst0/txant_en
add wave -noupdate -expand -group tx_path_top -group txant -radix decimal /tx_path_top_tb/tx_path_top_inst0/txant_cyc_before_en
add wave -noupdate -expand -group tx_path_top -group txant -radix decimal /tx_path_top_tb/tx_path_top_inst0/txant_cyc_after_en
add wave -noupdate -expand -group tx_path_top -expand -group pct /tx_path_top_tb/tx_path_top_inst0/pct_wrclk
add wave -noupdate -expand -group tx_path_top -expand -group pct /tx_path_top_tb/tx_path_top_inst0/in_pct_full
add wave -noupdate -expand -group tx_path_top -expand -group pct /tx_path_top_tb/tx_path_top_inst0/in_pct_wrreq
add wave -noupdate -expand -group tx_path_top -expand -group pct -radix hexadecimal -childformat {{/tx_path_top_tb/tx_path_top_inst0/in_pct_data(31) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(30) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(29) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(28) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(27) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(26) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(25) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(24) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(23) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(22) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(21) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(20) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(19) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(18) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(17) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(16) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(15) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(14) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(13) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(12) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(11) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(10) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(9) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(8) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(7) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(6) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(5) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(4) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(3) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(2) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(1) -radix hexadecimal} {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(0) -radix hexadecimal}} -subitemconfig {/tx_path_top_tb/tx_path_top_inst0/in_pct_data(31) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(30) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(29) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(28) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(27) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(26) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(25) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(24) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(23) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(22) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(21) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(20) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(19) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(18) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(17) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(16) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(15) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(14) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(13) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(12) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(11) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(10) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(9) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(8) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(7) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(6) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(5) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(4) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(3) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(2) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(1) {-height 16 -radix hexadecimal} /tx_path_top_tb/tx_path_top_inst0/in_pct_data(0) {-height 16 -radix hexadecimal}} /tx_path_top_tb/tx_path_top_inst0/in_pct_data
add wave -noupdate -expand -group tx_path_top -expand -group pct /tx_path_top_tb/tx_path_top_inst0/pct_loss_flg
add wave -noupdate -expand -group tx_path_top -expand -group pct /tx_path_top_tb/tx_path_top_inst0/pct_loss_flg_clr
add wave -noupdate -expand -group tx_path_top -group Out /tx_path_top_tb/tx_path_top_inst0/DIQ_l
add wave -noupdate -expand -group tx_path_top -group Out /tx_path_top_tb/tx_path_top_inst0/DIQ_h
add wave -noupdate -expand -group tx_path_top -group Out /tx_path_top_tb/tx_path_top_inst0/fsync
add wave -noupdate -expand -group tx_path_top -group Out /tx_path_top_tb/tx_path_top_inst0/DIQ
add wave -noupdate -radix hexadecimal /tx_path_top_tb/inst1_in_pct_data
add wave -noupdate -radix hexadecimal /tx_path_top_tb/pct_data
add wave -noupdate -expand -group p2d_wr_fsm -radix hexadecimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/pct_hdr_0_reg
add wave -noupdate -expand -group p2d_wr_fsm -radix hexadecimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/pct_hdr_1_reg
add wave -noupdate -expand -group p2d_wr_fsm -radix decimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/wr_cnt
add wave -noupdate -expand -group p2d_wr_fsm -radix hexadecimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/in_pct_data
add wave -noupdate -expand -group p2d_wr_fsm -radix hexadecimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/in_pct_data_reg
add wave -noupdate /tx_path_top_tb/inst0_rdempty
add wave -noupdate /tx_path_top_tb/inst0_rdreq
add wave -noupdate /tx_path_top_tb/inst1_in_pct_wrreq
add wave -noupdate /tx_path_top_tb/inst0_fifo_wrreq
add wave -noupdate -radix hexadecimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/pct_data
add wave -noupdate -radix decimal /tx_path_top_tb/tx_path_top_inst0/packets2data_top_inst0/packets2data_inst0/p2d_wr_fsm_inst0/pct_data_wrreq
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {211703 ps} 0} {{Cursor 2} {83766 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 786
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {211703 ps}
