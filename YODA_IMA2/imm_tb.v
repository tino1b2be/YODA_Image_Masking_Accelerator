`timescale 1ns / 1ps

module imm_tb;

	// Inputs
	reg clk;
	reg [11:0] image_pixel;
	reg [7:0] pixel_row;
	reg [8:0] pixel_col;
	reg [7:0] mask_row_offset;
	reg [8:0] mask_col_offset;
	
	// address values from the VGA controller
	reg [7:0] row_read;
	reg [8:0] col_read;

	// Outputs
	wire [7:0] pixel_row_out;
	wire [8:0] pixel_col_out;
	wire [11:0] pixel_result;
	wire [11:0] ram_pixel_out;

	// Instantiate the Unit Under Test (UUT)
	imm uut (
		.clk(clk), 
		.image_pixel(image_pixel), 
		.pixel_row(pixel_row), 
		.pixel_col(pixel_col), 
		.mask_row_offset(mask_row_offset), 
		.mask_col_offset(mask_col_offset), 
		.pixel_row_out(pixel_row_out), 
		.pixel_col_out(pixel_col_out), 
		.pixel_result(pixel_result)
	);

	// instantiate the RAM

	vga_buffer_ram ram (
		.pixel_result(pixel_result), 
		.pixel_row(pixel_row_out), 
		.pixel_col(pixel_col_out), 
		.row_read(row_read), 
		.col_read(col_read), 
		.pixel_out(ram_pixel_out)
	);

	initial begin
		$monitor("clock=%d, image=%d, result=%d",clk, image_pixel, pixel_result);
		// Initialize Inputs
		clk = 0;
		image_pixel = 12'h_FFF;
		pixel_row = 0;
		pixel_col = 0;
		mask_row_offset = 0;
		mask_col_offset = 0;
		
		row_read = 0;
		col_read = 0;

		// Wait 100 ns for global reset to finish
		#100	clk = 1;
		//#50	mask_pixel = 12'h_AAA;
		#100	clk = 0;
		pixel_col = 1;
		pixel_row = 0;
		image_pixel = 12'h_CBD;
		
		#100 clk = 1;
		
		#100 clk = 0;
		pixel_col = 2;
		pixel_row = 0;
		image_pixel = 12'h_7D8;
		
		#100 clk = 1;
		
		#100 clk = 0;
		
		#100 $finish;
		// Add stimulus here

	end
      
endmodule

