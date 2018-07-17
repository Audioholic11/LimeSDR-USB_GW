// ----------------------------------------------------------------------------	
// FILE: 	gpio_chirp_sync.v
// DESCRIPTION:	 
// DATE:	July 1, 2018
// AUTHOR(s):	Erik Moore DU2SRI
// REVISIONS:
// ----------------------------------------------------------------------------	

// ----------------------------------------------------------------------------
// Notes: To Sync with external square signal on the rising edge, counter control
// ----------------------------------------------------------------------------


//module gpio_chirp_sync(CLOCK_IN,SW,GPIO_0,LEDR, LEDG, HEX0, HEX1, HEX2,HEX3,HEX4,HEX5, HEX6, HEX7);
module gpio_chirp_sync_top(CLOCK_IN,SIG,RST,Q_reg,TRIG);

	input CLOCK_IN;
	input SIG;
	input RST;
	
	output reg [31:0] Q_reg;
	output TRIG;
	

	
	//wire CLK_1;
	//timern t0(CLOCK_IN,CLK_1);
	
	wire E,L,U_D,Q;
	//module SM_2(RSET,CLK,SIG,CLK_1,E,L,U_D,TRIG);
	SM_2 SM0(RST,CLOCK_IN,SIG,CLOCK_IN,E,L,U_D,TRIG);
	
	
	//counter(R,Clock,L,E,U_D,Q);
	counter #(32) c0(32'd0, CLOCK_IN, L, E, U_D, Q);
	
	always @ (posedge CLOCK_IN or posedge TRIG)
	if (TRIG) begin
		Q_reg <= Q;
	end else begin
		Q_reg <= Q_reg;
	end
	
		
endmodule 