`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:53:34 06/23/2017
// Design Name:   driver
// Module Name:   /home/bluelabuser/Desktop/John/YODA_Image_Masking_Accelerator/YODA_IMA2/driver_tb.v
// Project Name:  YODA_IMA2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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
		#100;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
		#50 clk = 1;
		#50 clk = 0;
        
		// Add stimulus here

	end
      
endmodule

