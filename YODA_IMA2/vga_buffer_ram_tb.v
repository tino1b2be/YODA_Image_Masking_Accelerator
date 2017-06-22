`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:24 06/22/2017
// Design Name:   vga_buffer_ram
// Module Name:   /home/tino1b2be/Documents/YODA_Image_Masking_Accelerator/YODA_IMA2/vga_buffer_ram_tb.v
// Project Name:  YODA_IMA2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_buffer_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_buffer_ram_tb;

	// Inputs
	reg [11:0] pixel_result;
	reg [7:0] pixel_row;
	reg [8:0] pixel_col;
	reg clk;
	reg [7:0] row_read;
	reg [8:0] col_read;

	// Outputs
	wire [11:0] pixel_out;

	// Instantiate the Unit Under Test (UUT)
	vga_buffer_ram uut (
		.pixel_result(pixel_result), 
		.pixel_row(pixel_row), 
		.pixel_col(pixel_col), 
		.clk(clk), 
		.row_read(row_read), 
		.col_read(col_read), 
		.pixel_out(pixel_out)
	);

	initial begin
		// Initialize Inputs
		pixel_result = 0;
		pixel_row = 0;
		pixel_col = 0;
		clk = 0;
		row_read = 0;
		col_read = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

