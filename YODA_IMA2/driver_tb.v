`timescale 1ns / 1ps


module driver_tb;

	// Inputs
	reg clk;

	// Outputs
	wire vga_vs;
	wire vga_hs;
	wire [3:0] vga_r;
	wire [3:0] vga_g;
	wire [3:0] vga_b;

	// Instantiate the Unit Under Test (UUT)
	driver uut (
		.clk(clk), 
		.vga_vs(vga_vs), 
		.vga_hs(vga_hs), 
		.vga_r(vga_r), 
		.vga_g(vga_g), 
		.vga_b(vga_b)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100 clk = 1;
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
		#10 clk = 1;
		#10 clk = 0;
		#10 clk = 1;
      #10 $finish;
		// Add stimulus here

	end
      
endmodule

