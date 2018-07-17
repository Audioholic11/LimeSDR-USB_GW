module SM_2(RSET,CLK,SIG,CLK_1,E,L,U_D,DisTrig);

	input RSET,CLK,SIG,CLK_1;
	output E,L,U_D,DisTrig;
	reg [2:1] y,Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	
	//Define the next state combinational circuit
	always @(CLK_1,SIG)
		case(y)
			A: if(CLK_1 ==1)  Y=B;
				else   			Y=A;
			B: if(SIG ==1)	   Y=C;
				else   			Y=B;
			C: if(SIG ==0)    Y=D;
				else   			Y=C;
			D: if(SIG ==1)    Y=A;
				else   			Y=D;
			default: Y=2'bxx;
		endcase
	
	//define  the sequenctial block
	
	always @(negedge RSET,posedge CLK)
		if (RSET ==0) y<=A;
		else y <= Y;
		
	//define output
	assign E = (y == C) | (y==D);
	assign L = (y == A);
	assign U_D = 1;
	assign DisTrig = (y==A) | (y==B);
	

endmodule 