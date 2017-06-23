`timescale 1ns / 1ps

module vga_tb;

	// Inputs
	reg clk;
	reg [11:0] mask_pixel_result;
	reg [7:0] mask_pixel_row_out;
	reg [8:0] mask_pixel_col_out;
	reg [3:0] r;
	reg [3:0] g;
	reg [3:0] b;

	// Outputs
	wire vga_vs;
	wire vga_hs;
	wire [3:0] vga_r;
	wire [3:0] vga_g;
	wire [3:0] vga_b;
	wire vFree;
	wire hFree;

	// Instantiate the Unit Under Test (UUT)
	vga_controller uut (
		.clk(clk), 
		.mask_pixel_result(mask_pixel_result), 
		.mask_pixel_row_out(mask_pixel_row_out), 
		.mask_pixel_col_out(mask_pixel_col_out), 
		.vga_vs(vga_vs), 
		.vga_hs(vga_hs), 
		.vga_r(vga_r), 
		.vga_g(vga_g), 
		.vga_b(vga_b), 
		.r(r), 
		.g(g), 
		.b(b), 
		.vFree(vFree), 
		.hFree(hFree)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mask_pixel_result = 0;
		mask_pixel_row_out = 0;
		mask_pixel_col_out = 0;
		r = 0;
		g = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

