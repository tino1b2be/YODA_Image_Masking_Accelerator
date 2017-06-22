`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:06 06/22/2017 
// Design Name: 
// Module Name:    driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module driver(
	input Clock
    );

// Inputs
	reg Clock;
	reg [7:0] mask_row_offset;
	reg [8:0] mask_col_offset;
	
	// address values from the VGA controller
	reg [7:0] row_read;
	reg [8:0] col_read;
	
	// Outputs
	wire [11:0] transfer_pixel_out;
	wire [7:0] transfer_pixel_row_out;
	wire [8:0] transfer_pixel_col_out;
	wire [7:0] mask_pixel_row_out;
	wire [8:0] mask_pixel_col_out;
	wire [11:0] mask_pixel_result;
	wire [11:0] ram_pixel_out;

	// Instantiate the Unit Under Test (UUT)
	transfer_interface uut (
		.Clock(Clock), 
		.pixel_out(transfer_pixel_out), 
		.pix_row(transfer_pixel_row_out), 
		.pix_col(transfer_pixel_col_out)
	);
	
	// Instantiate the Unit Under Test (UUT)
	imm masker (
		.clk(Clock), 
		.image_pixel(transfer_pixel_out), 
		.pixel_row(transfer_pixel_row_out), 
		.pixel_col(transfer_pixel_col_out), 
		.mask_row_offset(mask_row_offset), 
		.mask_col_offset(mask_col_offset), 
		.pixel_row_out(mask_pixel_row_out), 
		.pixel_col_out(mask_pixel_col_out), 
		.pixel_result(mask_pixel_result)
	);

	// instantiate the RAM

	vga_buffer_ram ram (
		.pixel_result(mask_pixel_result), 
		.pixel_row(mask_pixel_row_out), 
		.pixel_col(mask_pixel_col_out), 
		.row_read(row_read), 
		.col_read(col_read), 
		.pixel_out(ram_pixel_out)
	);


endmodule
