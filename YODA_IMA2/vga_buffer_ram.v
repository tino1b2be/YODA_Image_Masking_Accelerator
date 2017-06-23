`timescale 1ns / 1ps
`include "utils.v"

module vga_buffer_ram(
    input 		[11:0] 	pixel_result,
    input 		[7:0] 	pixel_row,
    input 		[8:0] 	pixel_col,
    //input 					clk,
    input 		[7:0] 	row_read,
    input 		[8:0] 	col_read,
    output reg [11:0] 	pixel_out
    );
	
	// RAM array for the VGA bugger
	reg [11:0] vga_buffer[(`IMAGE_WIDTH * `IMAGE_HEIGHT)-1 : 0];
	wire [8:0] width;
	assign width = 9'h_140;
	
	
	always@(*) begin
		// write the pixel input to the RAM
		vga_buffer[(pixel_row * width) + pixel_col] = pixel_result;
		// Read the pixel onto the output foe the VGA Controller to read.
		pixel_out = vga_buffer[(row_read * width) + col_read];
	end

endmodule
