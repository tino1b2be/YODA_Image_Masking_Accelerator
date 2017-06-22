`timescale 1ns / 1ps
`include "utils.v"

module vga_buffer_ram(
    input 		[11:0] 	pixel_result,
    input 		[7:0] 	pixel_row,
    input 		[8:0] 	pixel_col,
    input 					clk,
    input 		[7:0] 	row_read,
    input 		[8:0] 	col_read,
    output reg [11:0] 	pixel_out
    );
	
	// RAM array for the VGA bugger
	reg [11:0] vga_buffer[`IMAGE_WIDTH * `IMAGE_HEIGHT : 0];
	
	// create local registers to be used 
	reg [11:0]	pixel_result_reg;
   reg [7:0]	pixel_row_reg;
   reg [8:0]	pixel_col_reg;

   reg [7:0]	row_read_reg;
   reg [8:0]	col_read_reg;

	always@(posedge clk) begin
		pixel_result_reg 	= pixel_result;
		pixel_row_reg		= pixel_row;
		pixel_col_reg		= pixel_col;
		row_read_reg		= row_read;
		col_read_reg		= col_read;
	end
	
	always@(*) begin
		// write the pixel input to the RAM
		vga_buffer[pixel_row_reg * pixel_col_reg] = pixel_result_reg;
		// Read the pixel onto the output foe the VGA Controller to read.
		pixel_out = vga_buffer[row_read_reg * col_read_reg];
	end

endmodule
