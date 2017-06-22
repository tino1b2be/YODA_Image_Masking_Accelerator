`timescale 1ns / 1ps
`include "utils.v"

module vga_buffer_ram(
    input [11:0] pixel_result,
    input [7:0] pixel_row,
    input [8:0] pixel_col,
    input clk,
    input [7:0] row_read,
    input [8:0] col_read,
    output [11:0] pixel_out
    );
	
	// RAM array for the VGA bugger
	reg [11:0] vga_buffer[IMAGE_ROW*IMAGE_COL : 0];
	
	// create local registers to be used 
	reg [11:0]	pixel_result_reg;
   reg [7:0]	pixel_row_reg;
   reg [8:0]	pixel_col_reg;

   reg [7:0]	row_read_reg;
   reg [8:0]	col_read_reg;

	always@(posedge clk) begin
		pixel_result 	= pixel_result_reg;
		pixel_row		= pixel_row_reg;
		pixel_col		= pixel_col_reg;
		row_read			= row_read_reg;
		col_read			= col_read_reg;
	end
	
	always@(*) begin
		// write the pixel input to the RAM
		vga_buffer[pixel_row * pixel_col] = pixel_result;
		// Read the pixel onto the output foe the VGA Controller to read.
		pixel_out = vga_buffer[row_read * col_read];
	end

endmodule
