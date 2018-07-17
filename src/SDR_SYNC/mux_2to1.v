module mux_2to1(s, x, y, m);

	input s, x, y;
	output m;
	
	// Version 1 - Data Flow
	assign m = (~s & x) | (s & y);
	
endmodule
