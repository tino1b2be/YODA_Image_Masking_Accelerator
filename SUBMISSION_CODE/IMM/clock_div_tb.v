`timescale 1ns / 1ps

// test bench to clock the clock divider
module clock_div_tb;

	// Inputs
	reg clk;
	reg [31:0] div;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	clockDiv uut (
		.clk(clk), 
		.div(div), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		div = 2;			// divide clock by 2 (50 mhz)
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		div = 4;			// divide clock by 4 (25mhz)
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		div = 3;			// divide clock by three (33.3 mhz)
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		#10 $finish;
	end
      
endmodule

