// ----------------------------------------------------------------------------	
// FILE: 	gpio_sync_FSM.v
// DESCRIPTION:	 
// DATE:	July 1, 2018
// AUTHOR(s):	Erik Moore DU2SRI
// REVISIONS:
// ----------------------------------------------------------------------------	

// ----------------------------------------------------------------------------
// Notes: To Sync with external square signal on the rising edge, counter control
// ----------------------------------------------------------------------------
module gpio_sync_FSM(RSET,CLK,SIG,E,L,U_D,TRIG);

	input RSET,CLK,SIG;
	output E,L,U_D,TRIG;
	reg [2:1] y,Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	
	//Define the next state combinational circuit
	always @(CLK,SIG) 
	begin
		case(y)
			A: if(CLK ==1)  Y=B;
				else   			Y=A;
			B: if(CLK ==1)	   Y=C;
				else   			Y=B;
			C: if(SIG ==0)    Y=D;
				else   			Y=C;
			D: if(SIG ==1)    Y=A;
				else   			Y=D;
			default: Y=2'bxx;
		endcase
	end
	
	//define  the sequenctial block
	
	always @(negedge RSET,posedge CLK) 
	begin
		if (RSET ==0) 
			y<=A;
		else 
			y<=Y;
	end
	
	//define output
	assign E = (y== B) | (y == C) | (y==D);
	assign L = (y == A);
	assign U_D = 1;
	assign TRIG = (y==A) | (y==B);
	

endmodule 