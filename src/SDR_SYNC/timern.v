module timern(Clock_I, Clock_O);

	parameter bits = 13;
	parameter count = 4999;

	input Clock_I;	
	output reg Clock_O;
	
	reg [bits-1:0] slow_count;

/*
	// A large counter to produce a 1 milli second (approx) enable from the 50 MHz Clock
	always@(posedge Clock_I)
		slow_count <= slow_count + 1'b1;
*/
	
	always@(posedge Clock_I)
		if(slow_count == count)
		begin
			slow_count <= 0;
			Clock_O <= 1'b1;
		end
		else
		begin
			slow_count <= slow_count + 1'b1;
			Clock_O <= 1'b0;
		end
		
	// Pulse Out
/*	always@(posedge Clock_I)
		if(slow_count == count)
			Clock_O = 1;
		else
			Clock_O = 0;
*/			
endmodule
