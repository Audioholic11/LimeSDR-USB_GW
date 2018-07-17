module main(SW,LEDR, LEDG,CLOCK_50,GPIO_0, HEX0, HEX1, HEX2,HEX3,HEX4,HEX5, HEX6, HEX7);

	input CLOCK_50;
	input [17:0] SW;
	input [35:0] GPIO_0;
	output [17:0] LEDR;
	output [8:0] LEDG;
	output [0:6] HEX0, HEX1, HEX2,HEX3,HEX4,HEX5, HEX6, HEX7;
	//output LCD_RW, LCD_EN, LCD_RS, LCD_ON, LCD_BLON;
	//output [7:0] LCD_DATA;
	
	//assign LEDR[1:0] = SW[1:0];

	//module timern(Clock_I, Clock_O);
	
	wire CLK_1;
	timern t0(CLOCK_50,CLK_1);
	
	wire E,L,U_D,DisTrig;
	//SM_2(RSET,CLK,SIG,CLK_1,E,L,U_D,DisTrig);
	SM_2 SM0(SW[0],CLOCK_50,GPIO_0[9],CLK_1,E,L,U_D,DisTrig);
	//SM_2 SM0(SW[0],CLOCK_50,GPIO_0[9],CLK_1,LEDG[0],LEDG[1],LEDG[2]);
	assign LEDG[0] = E;
	assign LEDG[1] = L;
	assign LEDG[2] = U_D;
	assign LEDG[3] = DisTrig;
	
	wire [32:0] Q;
	//counter(R,Clock,L,E,U_D,Q);
	counter #(32) c0(32'd0, CLK_1, L, E, U_D, Q);
	assign LEDR[17:0] = Q[17:0];
	
	
	//hex_seg7(Q, HEX);
	//hex_seg7 hex_0(4'b0010, HEX0);
	
	
	
	//********************************************
	/*reg [8*16:1] mLCD_LINE1;
	reg [8*16:1] mLCD_LINE2;
	
	wire [7:0] counter_v = 8'd55;
	
	// An example how to change what to display on the LCD
	// Note: don't forget to toggle SW[16] in order to refresh what to write to the LCD
	always@(SW[17])
	begin
		if(SW[17] == 1)
		begin
			mLCD_LINE1 <= {"   ", Q[0]+48, "   "};
			mLCD_LINE2 <= "    LCD TEST    ";
		end
		else
		begin
			mLCD_LINE1 <= " FINAL PROJECT  ";
			mLCD_LINE2 <= " > DU UNIVERSITY";
		end
	end
	
	// Generate a Refresh
	reg [31:0] Clock_o;
	wire refresh = Clock_o[25];
	always@(posedge CLOCK_50) Clock_o <= Clock_o + 1;
	
	// Don't forget to turn on the LCD
	assign LCD_ON = 1'b1;
	assign LCD_BLON = 1'b1;

	LCD_MSG LCD0(CLOCK_50, refresh, mLCD_LINE1, mLCD_LINE2, LCD_DATA, LCD_RW, LCD_EN, LCD_RS);
	*/
	//****************************************
	
	wire [3:0] d1,d2,d3,d4,d5,d6,d7,d8;
	// Bin2BCD(binary,d1,d2,d3,d4,d5,d6,d7,d8);
	Bin2BCD BCD0(Q[25:0],d1,d2,d3,d4,d5,d6,d7,d8);
	
	// bin2dec(v, d0, d1);
	bin2dec bin2dec_0(d1, HEX0, );
	bin2dec bin2dec_1(d2, HEX1, );
	bin2dec bin2dec_2(d3, HEX2, );
	bin2dec bin2dec_3(d4, HEX3, );
	bin2dec bin2dec_4(d5, HEX4, );
	bin2dec bin2dec_5(d6, HEX5, );
	bin2dec bin2dec_6(d7, HEX6, );
	bin2dec bin2dec_7(d8, HEX7, );
	
		
endmodule 