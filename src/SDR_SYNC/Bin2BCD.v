module Bin2BCD(binary,d1,d2,d3,d4,d5,d6,d7,d8);
	input[25:0] binary;
	output reg [3:0] d1;
	output reg [3:0] d2;
	output reg [3:0] d3;
	output reg [3:0] d4;
	output reg [3:0] d5;
	output reg [3:0] d6;
	output reg [3:0] d7;
	output reg [3:0] d8;
	
	
	integer i;
	always @(binary)
	begin
		//set d's to zero
		d1 = 4'd0;
		d2 = 4'd0;
		d3 = 4'd0;
		d4 = 4'd0;
		d5 = 4'd0;
		d6 = 4'd0;
		d7 = 4'd0;
		d8 = 4'd0;
		
		
		for (i=25; i>=0; i=i-1)
		begin
			// add 3 to column >=5
			if(d8>=5)
				d8 = d8 + 3;
			if(d7>=5)
				d7 = d7 + 3;
			if(d6>=5)
				d6 = d6 + 3;
			if(d5>=5)
				d5 = d5 + 3;
			if(d4>=5)
				d4 = d4 + 3;
			if(d3>=5)
				d3 = d3 + 3;
			if(d2>=5)
				d2 = d2 + 3;
			if(d1>=5)
				d1 = d1 + 3;
				
			//shift left one
			d8 = d8 << 1;
			d8[0] = d7[3];
			
			d7 = d7 << 1;
			d7[0] = d6[3];
			
			d6 = d6 << 1;
			d6[0] = d5[3];
			
			d5 = d5 << 1;
			d5[0] = d4[3];
			
			d4 = d4 << 1;
			d4[0] = d3[3];
			
			d3 = d3 << 1;
			d3[0] = d2[3];
			
			d2 = d2 << 1;
			d2[0] = d1[3];
			
			d1 = d1 << 1;
			d1[0] = binary[i];
		end
	end
			
			
endmodule
