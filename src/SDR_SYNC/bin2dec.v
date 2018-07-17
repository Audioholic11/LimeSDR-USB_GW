module bin2dec(v, d0, d1);

	input [3:0] v;
	output [0:6] d1, d0;

	wire [2:0] c; // Circuit A Output
	wire z; // Comparator Output
	wire [3:0] m;
	
	//mux_2to1(s, x, y, m);
	mux_2to1 mux0(z, v[3], 0, m[3]);
	mux_2to1 mux1(z, v[2], c[2], m[2]);
	mux_2to1 mux2(z, v[1], c[1], m[1]);
	mux_2to1 mux3(z, v[0], c[0], m[0]);
	
	//segDecoder(x, hex);
	segDecoder(m, d0);
	
	// Comparator
	comparator C(v, z);
	
	// Circuit A
	circuitA cA(v[2:0], c);
	
	// Circuit B
	circuitB cB(z, d1);
	
endmodule
