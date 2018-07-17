module counter(R,Clock,L,E,U_D,Q);
	
	parameter n = 8;
	
	input [n-1:0] R;
	input Clock, L, E, U_D;
	output reg [n-1:0] Q;
	
	always @(posedge Clock)
		if (L)
			Q <= R;
		else if (E)
			Q <= Q + (U_D ? 1:-1);
			
	
endmodule 