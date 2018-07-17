module segDecoder(x, hex);

	input [3:0] x;
	output [0:6] hex;
	
	assign hex[0] = (x[2]&~x[1]&~x[0]) | (~x[3]&~x[2]&~x[1]&x[0]);
	assign hex[1] = x[2]&(x[1]^x[0]);
	assign hex[2] = (~x[2]&x[1]&~x[0]);
	assign hex[3] = (~x[2]&~x[1]&x[0])|(x[2]&~x[1]&~x[0])|(x[2]&x[1]&x[0]);
	assign hex[4] = x[0]|(x[2]&~x[1]);
	assign hex[5] = (x[1]&x[0])|(x[1]&~x[2])|(~x[3]&~x[2]&x[0]);
	assign hex[6] = (x[2]&x[1]&x[0])|(~x[3]&~x[2]&~x[1]);

endmodule
