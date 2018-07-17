module circuitB(z, d1);

	input z;
	output [0:6] d1;
	
	assign d1 = (z == 1) ? 7'b1001111 : 7'b0000001;

endmodule
