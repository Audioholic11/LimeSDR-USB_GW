-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- Generated by Quartus Prime Version 15.1 (Build Build 185 10/21/2015)
-- Created on Mon Jul  2 15:22:56 2018

FUNCTION gpio_chirp_sync_top (clk, reset_n, chirp_sig, sample_width[1..0], mode, trxiqpulse, ddr_en, mimo_en, ch_en[1..0], chirp_sync_en)
	RETURNS (sync_period[63..0], chirp_trig);