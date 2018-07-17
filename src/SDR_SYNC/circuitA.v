module circuitA(v, c);

	input [2:0] v;
	output [2:0] c;

	assign c[2] = v[2]&v[1];
	assign c[1] = ~v[1];
	assign c[0] = v[0];

endmodule
