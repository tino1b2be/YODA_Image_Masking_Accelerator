`timescale 1ns / 1ps

// top module for the IMA
module top_level(
	input wire 			clk, 		// 100Mhz
	output wire			vga_vs,	// vertical sync signal
	output wire			vga_hs,	// horizontal sync signal
	output wire	[3:0]	vga_r,	// vga red channel
	output wire	[3:0]	vga_g,	// vga green channel
	output wire	[3:0]	vga_b		// vga blue channel
    );

	// these should come from a mask offset manager module
	wire [7:0] mask_row_offset;
	wire [8:0] mask_col_offset;
	
	// address values from the VGA controller
	wire [7:0] vga_row_read;
	wire [8:0] vga_col_read;
	
	// Outputs
	wire [11:0] transfer_pixel_out;
	wire [11:0] mask_pixel_out;
	wire [7:0] 	transfer_pixel_row_out;
	wire [8:0] 	transfer_pixel_col_out;
	wire [7:0] 	masked_pixel_row_out;
	wire [8:0] 	masked_pixel_col_out;
	wire [11:0] masked_pixel_result;
	wire [11:0] ram_pixel_out;
	wire [11:0] image_rom_pixel_out;
	wire [6:0] 	mask_row;
	wire [7:0] 	mask_col;
	wire [7:0] 	image_rom_pix_row;
	wire [8:0] 	image_rom_pix_col;

	assign mask_col_offset = 0;
	assign mask_row_offset = 0;

	// create a 50mhz clock for transfer and imm modules
	clockDiv clock_50(
		.clk(clk),
		.div(32'd_2),
		.out(clk_x)
	);
	
	// instantiate the image brom module
	image_rom image(
		.row(image_rom_pix_row),
		.col(image_rom_pix_col),
		.color_data(image_rom_pixel_out)
	);

	// Instantiate the transfer interface	
	transfer_interface t_interface (
		.Clock(clk_x), 
		.rom_pixel(image_rom_pixel_out),
		.pixel_out(transfer_pixel_out), 
		.pix_row(transfer_pixel_row_out), 
		.pix_col(transfer_pixel_col_out),
		.rom_pix_row(image_rom_pix_row), 
		.rom_pix_col(image_rom_pix_col)
	);
	
	// instantiate the mask brom module
	mask_rom mask(
		.row(mask_row),
		.col(mask_col),
		.color_data(mask_pixel_out)
	);
	
	// Instantiate the image masking module
	imm imm (
		.clk(clk_x), 
		.image_pixel(transfer_pixel_out), 
		.mask_pixel(mask_pixel_out), // todo
		.pixel_row(transfer_pixel_row_out), 
		.pixel_col(transfer_pixel_col_out), 
		.mask_row_offset(mask_row_offset), 
		.mask_col_offset(mask_col_offset), 
		.pixel_row_out(masked_pixel_row_out), 
		.pixel_col_out(masked_pixel_col_out),  
		.mask_row(mask_row), 
		.mask_col(mask_col), 
		.pixel_result(masked_pixel_result)
	);

	// instantiate the vga_buffer RAM
	vga_buffer_ram ram (
		.pixel_result(masked_pixel_result), 
		.pixel_row(masked_pixel_row_out), 
		.pixel_col(masked_pixel_col_out), 
		.row_read(vga_row_read), 
		.col_read(vga_col_read), 
		.pixel_out(ram_pixel_out)
	);
	
	// instantiate the VGA controller
	vga_controller vga_controller(
		.clk(clk),
		.ram_pixel(ram_pixel_out),
		.vga_vs(vga_vs),
		.vga_hs(vga_hs),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.row_read(vga_row_read),
		.col_read(vga_col_read)
	);

endmodule
