`timescale 1ns / 1ps


module driver(
	input wire clk, // 100Mhz
	output wire	vga_vs,
	output wire	vga_hs,
//	output wire	hFree,
//	output wire	vFree,	
	output wire	[3:0]		vga_r,
	output wire	[3:0]		vga_g,
	output wire	[3:0]		vga_b
    );

	wire	hFree;
	wire	vFree;
	
	//wire clk_50;

// Inputs
	//reg Clock;
	reg [7:0] mask_row_offset;
	reg [8:0] mask_col_offset;
	
	// address values from the VGA controller
	wire [7:0] row_read;
	wire [8:0] col_read;
	
	// Outputs
	wire [11:0] transfer_pixel_out;
	wire [7:0] transfer_pixel_row_out;
	wire [8:0] transfer_pixel_col_out;
	wire [7:0] mask_pixel_row_out;
	wire [8:0] mask_pixel_col_out;
	wire [11:0] mask_pixel_result;
	wire [11:0] ram_pixel_out;

// create a 50mhz clock
	clockDiv clock_50(
		.clk(clk),
		.div(32'd_10),
		.out(clk_x)
	);

	// Instantiate the Unit Under Test (UUT)
	transfer_interface uut (
		.Clock(clk_x), 
		.pixel_out(transfer_pixel_out), 
		.pix_row(transfer_pixel_row_out), 
		.pix_col(transfer_pixel_col_out)
	);
	
	// Instantiate the Unit Under Test (UUT)
	imm masker (
		.clk(clk_x), 
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

	vga_controller vga_controller(
		.clk(clk),
		.ram_pixel(ram_pixel_out),
		.vga_vs(vga_vs),
		.vga_hs(vga_hs),
		.hFree(hFree),
		.vFree(vFree),	
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.row_read(row_read),
		.col_read(col_read)
	);

endmodule
