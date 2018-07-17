-- ----------------------------------------------------------------------------	
-- FILE: 	gpio_sync_top.vhd
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
entity gpio_chirp_sync_top is
   generic(
      chirp_sync_width 		: integer := 64 --bus width in bits  
   );
   port (
      clk               	: in std_logic;
		counter_clk				: in std_logic;
      reset_n           	: in std_logic;
		
		-- Chirp Sync I/Os
		chirp_sig				: in std_logic;
		sync_period				: out std_logic_vector(chirp_sync_width-1 downto 0);
		chirp_trig				: out std_logic;
      
		--Mode settings
      sample_width         : in std_logic_vector(1 downto 0); --"10"-12bit, "01"-14bit, "00"-16bit;
      mode                 : in std_logic; -- JESD207: 1; TRXIQ: 0
      trxiqpulse           : in std_logic; -- trxiqpulse on: 1; trxiqpulse off: 0
      ddr_en               : in std_logic; -- DDR: 1; SDR: 0
      mimo_en              : in std_logic; -- MIMO: 1; SISO: 0
      ch_en                : in std_logic_vector(1 downto 0); --"01" - Ch. A, "10" - Ch. B, "11" - Ch. A and Ch. B. 
		chirp_sync_en			: in std_logic  -- chirp sync enable
     
        );
end gpio_chirp_sync_top;


-- ----------------------------------------------------------------------------
-- Architecture
-- ----------------------------------------------------------------------------
architecture arch of gpio_chirp_sync_top is
--declare signals,  components her

--sync registers
signal reset_n_sync           : std_logic;
signal sample_width_sync      : std_logic_vector(1 downto 0); 
signal mode_sync              : std_logic;
signal trxiqpulse_sync        : std_logic; 
signal ddr_en_sync            : std_logic; 
signal mimo_en_sync           : std_logic;
signal ch_en_sync             : std_logic_vector(1 downto 0);

--inst0
signal inst0_chirp_signal		: std_logic;
signal inst0_chirp_trig			: std_logic;
signal inst0_load_counter     : std_logic;
signal inst0_enable_counter	: std_logic := '1';
signal inst0_U_D					: std_logic;

--inst5
signal inst5_q                : std_logic_vector(chirp_sync_width-1 downto 0);
signal q_hold          			: std_logic_vector(chirp_sync_width-1 downto 0);

--internal signals
signal sld_counter        		: std_logic;
signal sclr_counter       		: std_logic;
signal data_counter        	: std_logic_vector(chirp_sync_width-1 downto 0);
signal counter_enable			: std_logic;	



-- ----------------------------------------------------------------------------		  
-- gpio_sync_FSM(RSET,CLK,SIG,E,L,U_D,TRIG);
-- ----------------------------------------------------------------------------
component gpio_sync_FSM is
	port(
		RSET 		: in std_logic;
		CLK		: in std_logic;
		SIG		: in std_logic;
		E			: out std_logic;
		L			: out std_logic;
		U_D		: out std_logic;
		TRIG		: out std_logic		
		);
end component;


begin
-- ----------------------------------------------------------------------------
-- sync registers
-- ----------------------------------------------------------------------------
sync_reg0 : entity work.sync_reg 
port map(clk, '1', reset_n, reset_n_sync);

sync_reg1 : entity work.sync_reg 
port map(clk, '1', mode, mode_sync);

sync_reg2 : entity work.sync_reg 
port map(clk, '1', trxiqpulse, trxiqpulse_sync);

sync_reg3 : entity work.sync_reg 
port map(clk, '1', ddr_en, ddr_en_sync);

sync_reg4 : entity work.sync_reg 
port map(clk, '1', mimo_en, mimo_en_sync);


bus_sync_reg0 : entity work.bus_sync_reg
generic map (2)
port map(clk, '1', ch_en, ch_en_sync);

-- Default sld and data (only use sclr)

--sld_counter <= '0';
sclr_counter <= '0';
data_counter <= std_logic_vector(to_unsigned(1, data_counter'length));
counter_enable <= inst0_enable_counter and counter_clk;

-- ----------------------------------------------------------------------------
-- Instance for packing sample counter for packet forming
-- ----------------------------------------------------------------------------        
smpl_cnt_inst5 : entity work.smpl_cnt
   generic map(
      cnt_width   => chirp_sync_width
   )
   port map(

      clk         => clk,
      reset_n     => reset_n_sync,
      mode        => mode_sync,
      trxiqpulse  => trxiqpulse_sync,
      ddr_en      => ddr_en_sync,
      mimo_en     => mimo_en_sync,
      ch_en       => ch_en_sync,
      sclr        => sclr_counter,
      sload       => inst0_load_counter,
      data        => data_counter,
      cnt_en      => counter_enable,
      q           => inst5_q        
        );


trigger_hold: process(reset_n, clk)
begin
	if reset_n='0' then
		q_hold <= (others=>'0');         
	elsif (clk'event and clk = '1') then
		if (inst0_chirp_trig = '1') then
		q_hold <= inst5_q;
		else
		q_hold <= q_hold;
		end if;
 end if;
end process trigger_hold;
-- bus_sync_reg1 : entity work.bus_sync_reg
--generic map (chirp_sync_width)
--port map(inst0_chirp_trig, '1', inst5_q, q_hold);

 -- ----------------------------------------------------------------------------		  
-- gpio_sync_FSM(RSET,CLK,SIG,CLK_1,E,L,U_D,TRIG);
-- ---------------------------------------------------------------------------

gpio_sync_FMS_inst0 : gpio_sync_FSM port map(
		reset_n_sync,
		clk,
		chirp_sig,
		inst0_enable_counter,
		inst0_load_counter,
		inst0_U_D,
		inst0_chirp_trig
		);
		  
		  
-- Outputs
chirp_trig <= inst0_chirp_trig;
sync_period <= q_hold;

end arch;   