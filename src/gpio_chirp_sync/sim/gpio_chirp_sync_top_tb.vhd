-- ----------------------------------------------------------------------------	
-- FILE: 	gpio_sync_top_tb.vhd
-- DESCRIPTION:	 
-- DATE:	July 1, 2018
-- AUTHOR(s):	Erik Moore DU2SRI
-- REVISIONS:
-- ----------------------------------------------------------------------------	

-- ----------------------------------------------------------------------------
-- Notes: To Sync with external square signal on the rising edge
-- ----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ----------------------------------------------------------------------------
-- Entity declaration
-- ----------------------------------------------------------------------------
entity gpio_chirp_sync_top_tb is
end gpio_chirp_sync_top_tb;


-- ----------------------------------------------------------------------------
-- Architecture
-- ----------------------------------------------------------------------------
architecture arch of gpio_chirp_sync_top_tb is

	constant clk_period   	: time := 50 ns;
	constant chirp_period  	: time := 10 us;

	signal r_clk				: std_logic;
	signal r_reset_n			: std_logic := '1';
	signal r_chirp_sig		: std_logic;
	signal w_sync_period		: std_logic_vector(63 downto 0);
	signal w_chirp_trig		: std_logic;
	
	signal w_testout			: std_logic;
	
	signal r_sample_width	: std_logic_vector(1 downto 0) := "10";
	signal r_mode				: std_logic := '0';
	signal r_trxiqpulse		: std_logic := '0';
	signal r_ddr_en			: std_logic := '0';
	signal r_mimo_en			: std_logic := '0';
	signal r_ch_en				: std_logic_vector(1 downto 0) := "10";
	signal r_chirp_sync_en	: std_logic := '1';


	component gpio_chirp_sync_top is
	generic (
	chirp_sync_width 		: integer := 64 --bus width in bits 
	);

	port (
		clk               	: in std_logic;
		counter_clk				: in std_logic;
		reset_n           	: in std_logic;

		-- Chirp Sync I/Os
		chirp_sig				: in std_logic;
		sync_period				: out std_logic_vector(63 downto 0);
		chirp_trig				: out std_logic;
	
		TESTOUT					: out std_logic;
			
		--Mode settings
		sample_width         : in std_logic_vector(1 downto 0); --"10"-12bit, "01"-14bit, "00"-16bit;
		mode                 : in std_logic; -- JESD207: 1; TRXIQ: 0
		trxiqpulse           : in std_logic; -- trxiqpulse on: 1; trxiqpulse off: 0
		ddr_en               : in std_logic; -- DDR: 1; SDR: 0
		mimo_en              : in std_logic; -- SISO: 1; MIMO: 0
		ch_en                : in std_logic_vector(1 downto 0); --"01" - Ch. A, "10" - Ch. B, "11" - Ch. A and Ch. B. 
		chirp_sync_en			: in std_logic  -- chirp sync enable
	);
	end component gpio_chirp_sync_top;
	
begin

--clock
clock: process is
begin
	r_clk <= '0'; wait for clk_period/2;
	r_clk <= '1'; wait for clk_period/2;
end process clock;

--reset
res: process is
begin
	r_reset_n <= '0'; wait for clk_period*2;
	r_reset_n <= '1'; wait;
end process res;

gpio_chirp_sync_top_INST : gpio_chirp_sync_top
	port map (
		clk               	=> r_clk,
		counter_clk				=> r_clk,
		reset_n           	=> r_reset_n,

		-- Chirp Sync I/Os
		chirp_sig				=> r_chirp_sig,
		sync_period				=> w_sync_period,
		chirp_trig				=> w_chirp_trig,
		
		TESTOUT					=> w_testout,
			
		--Mode settings
		sample_width         => r_sample_width,
		mode                 => r_mode,
		trxiqpulse           => r_trxiqpulse,
		ddr_en               => r_ddr_en,
		mimo_en              => r_mimo_en,
		ch_en                => r_ch_en,
		chirp_sync_en			=> r_chirp_sync_en
	);
	
	
	
chirp_sig_input: process is
begin
    r_chirp_sig <= '0'; wait for chirp_period/2;
	 r_chirp_sig <= '1'; wait for chirp_period/2;
end process chirp_sig_input;

end arch;   
