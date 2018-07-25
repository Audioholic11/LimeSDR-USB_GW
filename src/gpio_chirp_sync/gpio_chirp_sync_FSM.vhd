-- ----------------------------------------------------------------------------	
-- FILE: 	gpio_chirp_sync_FSM.vhd
-- DESCRIPTION:	 
-- DATE:	July 1, 2018
-- AUTHOR(s):	Erik Moore DU2SRI
-- REVISIONS:
-- ----------------------------------------------------------------------------	

-- ----------------------------------------------------------------------------
-- Notes:
-- ----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ----------------------------------------------------------------------------
-- Entity declaration
-- ----------------------------------------------------------------------------
entity gpio_chirp_sync_FSM is
   port (
      clk               : in std_logic;
      reset_n           : in std_logic;
      sig					: in std_logic;
		enable				: out std_logic;
		load					: out std_logic;
		u_d					: out std_logic;
		trig					: out std_logic
        );
end gpio_chirp_sync_FSM;

-- ----------------------------------------------------------------------------
-- Architecture
-- ----------------------------------------------------------------------------
architecture arch of gpio_chirp_sync_FSM is
--declare signals,  components here

type state_type is (A, B, C, D);
signal current_state, next_state : state_type;

signal enable_sig 	: std_logic;
signal load_sig 		: std_logic;
signal trig_sig		: std_logic;
signal u_d_sig		: std_logic;
  
begin


-- ----------------------------------------------------------------------------
-- Enable Output
-- ----------------------------------------------------------------------------
enable_proc : process(clk, reset_n)
begin
   if reset_n = '0' then 
      enable_sig <= '0';
   elsif (clk'event AND clk='1') then 
      if current_state = A then
         enable_sig <= '0';
      else 
         enable_sig <= '1';
      end if;
   end if;
end process;

enable <= enable_sig;

-- ----------------------------------------------------------------------------
-- Load Output
-- ----------------------------------------------------------------------------
load_proc : process(clk, reset_n)
begin
   if reset_n = '0' then 
      load_sig <= '0';
   elsif (clk'event AND clk='1') then 
      if current_state = A then
         load_sig <= '1';
      else 
         load_sig <= '0';
      end if;
   end if;
end process;

load <= load_sig;


-- ----------------------------------------------------------------------------
-- trig Output
-- ----------------------------------------------------------------------------
trig_proc : process(clk, reset_n)
begin
   if reset_n = '0' then 
      trig_sig <= '0';
   elsif (clk'event AND clk='1') then 
      if (current_state = A OR current_state = B) then
         trig_sig <= '1';
      else 
         trig_sig <= '0';
      end if;
   end if;
end process;

trig <= trig_sig;

-- ----------------------------------------------------------------------------
-- trig Output
-- ----------------------------------------------------------------------------
u_d_proc : process(clk, reset_n)
begin
   if reset_n = '0' then 
      u_d_sig <= '1';
   elsif (clk'event AND clk='1') then 
      u_d_sig <= '1';
   end if;
end process;

u_d <= u_d_sig;

-- ----------------------------------------------------------------------------
--state machine
-- ----------------------------------------------------------------------------
fsm_f : process(clk, reset_n)begin
	if(reset_n = '0')then
		current_state <= A;
	elsif(clk'event and clk = '1')then 
		current_state <= next_state;
	end if;	
end process;

-- ----------------------------------------------------------------------------
--state machine combo
-- ----------------------------------------------------------------------------
fsm : process(current_state, sig,clk) begin
	next_state <= current_state;
	case current_state is
	  
		when A =>          
           
			  next_state <= B;
       
      when B =>        -- state to capture pct_buff_rdy 
            next_state <= C;
               
      when C =>          -- read smpl_rd_size cycles
         if sig = '0' then 
            next_state <= D;
         else 
            next_state <= C;
         end if;
			
		when D =>
			if sig = '1' then
				next_state <= A;
			else
				next_state <= D;
			end if;       
      
            
		when others => 
			next_state <= A;
	end case;
end process;
  
end arch;   





