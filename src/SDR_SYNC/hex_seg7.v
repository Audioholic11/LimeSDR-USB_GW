module hex_seg7(Q, HEX);

	input [3:0] Q;
	output reg [0:6] HEX;
	
	always@(Q)
	begin
		case(Q)
			0 : HEX = 7'b0000001;
			1 : HEX = 7'b1001111;
			2 : HEX = 7'b0010010;
			3 : HEX = 7'b0000110;
			4 : HEX = 7'b1001100;
			5 : HEX = 7'b0100100;
			6 : HEX = 7'b0100000;
			7 : HEX = 7'b0001111;
			8 : HEX = 7'b0000000;
			9 : HEX = 7'b0001100;
			10 : HEX = 7'b0001000;
			11 : HEX = 7'b1100000;
			12 : HEX = 7'b0110001;
			13 : HEX = 7'b1000010;
			14 : HEX = 7'b0110000;
			15 : HEX = 7'b0111000;
		endcase
	end

endmodule
