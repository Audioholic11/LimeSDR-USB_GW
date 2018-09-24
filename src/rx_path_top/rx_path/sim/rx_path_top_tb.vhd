-- ----------------------------------------------------------------------------	
-- FILE: 	rx_path_top_tb.vhd
-- DESCRIPTION:	
-- DATE:	Feb 13, 2014
-- AUTHOR(s):	Lime Microsystems
-- REVISIONS:
-- ----------------------------------------------------------------------------	
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.STD_LOGIC_TEXTIO.ALL;
use STD.textio.all;

-- ----------------------------------------------------------------------------
-- Entity declaration
-- ----------------------------------------------------------------------------
entity rx_path_top_tb is
end rx_path_top_tb;

-- ----------------------------------------------------------------------------
-- Architecture
-- ----------------------------------------------------------------------------

architecture tb_behave of rx_path_top_tb is
   constant clk0_period   : time := 10 ns;
   constant clk1_period   : time := 10 ns; 
	constant chirp_period  	: time := 20 us;
   --signals
	signal clk0,clk1		   : std_logic;
	signal reset_n          : std_logic; 
   
   signal sample_width     : std_logic_vector(1 downto 0) := "00"; --"10"-12bit, "01"-14bit, "00"-16bit;
   signal smpl_nr_delay    : integer := 3422; -- delay value through buffers to successfully synchronize   
   signal mode			      : std_logic:='0'; -- JESD207: 1; TRXIQ: 0
	signal trxiqpulse	      : std_logic:='0'; -- trxiqpulse on: 1; trxiqpulse off: 0
	signal ddr_en 		      : std_logic:='0'; -- DDR: 1; SDR: 0
	signal mimo_en 	      : std_logic:='0'; -- MIMO: 1; SISO: 0
	signal ch_en		      : std_logic_vector(1 downto 0):="10"; --"01" - Ch. A, "10" - Ch. B, "11" - Ch. A and Ch. B. 
	signal fidm			      : std_logic:='0'; -- External Frame ID mode. Frame start at fsync = 0, when 0. Frame start at fsync = 1, when 1. 
   
   
	-- Data to BB
	signal inst0_DIQ 			: std_logic_vector(11 downto 0);
	signal inst0_fsync		: std_logic; --Frame start

	--ins1 signals
	--signal inst1_fifo_wrreq	: std_logic;
	--signal inst1_fifo_wdata : std_logic_vector(47 downto 0);
	
	signal inst1_smplfifo_wrreq	: std_logic;
   
   signal inst1_pct_fifo_wrreq   : std_logic;
   signal inst1_pct_fifo_wdata   : std_logic_vector(63 downto 0);
   signal wrreq_cnt              : unsigned (15 downto 0):=(others=>'0');
   signal wrreq_cnt_max          : unsigned (15 downto 0);
	
	--chirp sig
	signal chirp_sig					: std_logic;
	signal chirp_sync_en				: std_logic := '1';
	
	signal sync_period				: std_logic_vector(63 downto 0);
	signal chirp_trig					: std_logic;
	
	signal inst2_counter_enable 	: std_logic;
   
  

begin 

   wrreq_cnt_max <= x"0080" when sample_width = "01" else 
                    x"0200";
  
      clock0: process is
	begin
		clk0 <= '0'; wait for clk0_period/2;
		clk0 <= '1'; wait for clk0_period/2;
	end process clock0;

   	clock: process is
	begin
		clk1 <= '0'; wait for clk1_period/2;
		clk1 <= '1'; wait for clk1_period/2;
	end process clock;
	
		res: process is
	begin
		reset_n <= '0'; wait for clk0_period*2;
		reset_n <= '1'; wait;
	end process res;

	
--chirp sig simulation
	chirp_sig_input: process is
	begin
		 chirp_sig <= '0'; wait for chirp_period/2;
		 chirp_sig <= '1'; wait for chirp_period/2;
	end process chirp_sig_input;
	
	inst2_counter_enable <= inst1_smplfifo_wrreq;
-- gpio_chirp_sync_top instance
	inst2_gpio_chirp_sync_top : entity work.gpio_chirp_sync_top
generic map(
	chirp_sync_width 		=> 64
)
port map (
	clk               	=> clk0,
	counter_clk				=> inst2_counter_enable,
	reset_n           	=> reset_n,

	-- Chirp Sync I/Os
	sync_sig				=> chirp_sig,
	sync_period				=> sync_period,
	sync_trig				=> chirp_trig,
	
	TESTOUT					=> open,
		
	--Mode settings
	sample_width         => sample_width,
	mode                 => mode,
	trxiqpulse           => trxiqpulse,
	ddr_en               => ddr_en,
	mimo_en              => mimo_en,
	ch_en                => ch_en,
	chirp_sync_en			=> chirp_sync_en
);
   
-- simulated data
   inst0_LMS7002_DIQ2 : entity work.LMS7002_DIQ2_sim 
generic map (
	--file_name => "sim/adc_data",
	--file_name => "sim/adc_data_12b_chirp",
	file_name => "sim/adc_data_16b_chirp",
	--file_name => "sim/adc_data_12b_full",
	--file_name => "sim/adc_data_16b_full",
	data_width => 12
)
port map(
	clk       	=> clk0,
	reset_n   	=> reset_n, 
	mode			=> mode,
	trxiqpulse	=> trxiqpulse,
	ddr_en 		=> ddr_en, 
	mimo_en		=> mimo_en,
	fidm			=> fidm, 

	-- Data to BB
	DIQ 			=> inst0_DIQ,
	fsync			=> inst0_fsync
	
    );
    
    
inst1_rx_path_top : entity work.rx_path_top
   generic map( 
      dev_family				=> "Cyclone IV E",
      iq_width					=> 12,
      invert_input_clocks	=> "OFF",
      smpl_buff_rdusedw_w  => 11, --bus width in bits 
      pct_buff_wrusedw_w   => 12 --bus width in bits 
      )
   port map(
      clk                  => clk0,
      reset_n              => reset_n,
      test_ptrn_en         => '0',
      sample_width         => sample_width,
      mode			         => mode,
		trxiqpulse	         => trxiqpulse,
		ddr_en 		         => ddr_en,
		mimo_en		         => mimo_en,
		ch_en			         => ch_en,
		fidm			         => fidm,
		chirp_sync_en			=> chirp_sync_en,
		--Limelight Rx
      DIQ		 	         => inst0_DIQ,
		fsync	 	            => inst0_fsync,
		--samples
      smpl_fifo_wrreq_out  => inst1_smplfifo_wrreq,
		--pct
      pct_fifo_wusedw      => (others=>'0'),
      pct_fifo_wrreq       => inst1_pct_fifo_wrreq,
      pct_fifo_wdata       => inst1_pct_fifo_wdata,
		--smpl_cmp
      clr_smpl_nr          => '0',
      ld_smpl_nr           => '0',
      smpl_nr_in           => (others=> '0'),
      smpl_nr_cnt          => open,
      tx_pct_loss          => '0',
      tx_pct_loss_clr      => '0',
		
		--sample compare
      smpl_cmp_start       => '0',
      smpl_cmp_length      => (others=> '0'),
      smpl_cmp_done        => open,
      smpl_cmp_err         => open,
		--chirp_sync
		chirp_sync_length		=> sync_period,
		chirp_sync_trig		=> chirp_trig,
		bit_pack_valid			=> open,
		smpl_buff_rdreq		=> open
     
        );
        
 -- ----------------------------------------------------------------------------
-- Write packet output to file
-- ----------------------------------------------------------------------------       
process(clk0) is
   --FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_12b_chirp";
	FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_16b_chirp";
	--FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_12b_full";
	--FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_16b_full";
   -- FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_6_12b";
   -- FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_6_14b";
   -- FILE out_file  : TEXT OPEN WRITE_MODE IS "sim/out_pct_6_16b";
   variable out_line : LINE;
begin
   if rising_edge(clk0) then 
      if inst1_pct_fifo_wrreq = '1' then
         if wrreq_cnt < wrreq_cnt_max-1 then 
            wrreq_cnt <= wrreq_cnt+1;
         else 
            wrreq_cnt <= (others=>'0');
         end if;
            if wrreq_cnt = 1 then 
               HWRITE(out_line,std_logic_vector(unsigned(inst1_pct_fifo_wdata)+smpl_nr_delay));
               WRITELINE(out_file, out_line);
            else 
               HWRITE(out_line,inst1_pct_fifo_wdata);
               WRITELINE(out_file, out_line);
            end if;
      end if;
   end if;

end process;
	
	
end tb_behave;
  
  


  
