`timescale 1ns / 1ps

// testbench for the image masking module
module imm_tb;

	// Inputs
	reg clk;
	reg [11:0] image_pixel;		// image pixel to be masked.
	reg [7:0] pixel_row;			// pixel row address
	reg [8:0] pixel_col;			// pixel col address
	reg [7:0] mask_row_offset;	// mask row offset (from the mask offset module)
	reg [8:0] mask_col_offset;	// mask column offset (from the mask offset module)

	// Outputs
	wire [7:0] pixel_row_out;	// row address of the pixel going to he vga_buffer
	wire [7:0] mask_row;			// row address of the mask pixel in brom
	wire [8:0] pixel_col_out;	// col address of the pixel going to he vga_buffer
	wire [8:0] mask_col;			// col address of the mask pixel in brom
	wire [11:0] pixel_result;	// output of the image masking module
	wire [11:0] mask_pixel;		// masking pixel to be used for masking

	// Instantiate the Unit Under Test (UUT)
	imm uut (
		.clk(clk), 
		.image_pixel(image_pixel), 
		.mask_pixel(mask_pixel), 
		.pixel_row(pixel_row), 
		.pixel_col(pixel_col), 
		.mask_row_offset(mask_row_offset), 
		.mask_col_offset(mask_col_offset), 
		.pixel_row_out(pixel_row_out), 
		.mask_row(mask_row), 
		.pixel_col_out(pixel_col_out), 
		.mask_col(mask_col), 
		.pixel_result(pixel_result)
	);
	
	// Instantiate the mask b_rom module
	mask_rom mask(
		.row(mask_row),
		.col(mask_col),
		.color_data(mask_pixel)
	);

	initial begin
	
		$monitor("clock=%d, image=%d, mask=%d, result=%d",clk, image_pixel, mask_pixel, pixel_result);
		
		// Initialize Inputs
		clk = 0;
		image_pixel = 12'h_FFF;
		pixel_row = 0;
		pixel_col = 0;
		mask_row_offset = 5;
		mask_col_offset = 5;

		#50 clk = 1; 				
		// pixel result should be 0xFFF (outside mask therefore unchanged)
		
		#50 clk = 0;
		pixel_row = 15;
		pixel_col = 10;
		mask_row_offset = 5;
		mask_col_offset = 5;
		
		#50 clk = 1;
		// the next pixel is inside the mask
		// the mask pixel to be used is at position (row = 10,col = 5), and this pixel value is FFF at line 1794 in the mask brom)
		// therefore the result should be 0xFFF XOR 0xFFF = 0x000.
		
		#50 clk = 0;
		image_pixel = 12'h_AAA;
		pixel_row = 10;
		pixel_col = 90;
		mask_row_offset = 2;
		mask_col_offset = 1;
		
		#50 clk = 1;
		// mask pixel used is "12'b000100010001" on line 1522 in the mask_rom (row = 8, col = 89)
		// expected result is 0xAAA XOR 0x111 = 0xBBB
		
		#50 $finish;
	end
      
endmodule

