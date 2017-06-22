`timescale 1ns / 1ps

module vga_buffer_ram_tb;

	// Inputs
	reg [11:0] pixel_result;
	reg [7:0] pixel_row;
	reg [8:0] pixel_col;
	//reg clk;
	reg [7:0] row_read;
	reg [8:0] col_read;

	// Outputs
	wire [11:0] pixel_out;

	// Instantiate the Unit Under Test (UUT)
	vga_buffer_ram uut (
		.pixel_result(pixel_result), 
		.pixel_row(pixel_row), 
		.pixel_col(pixel_col), 
		//.clk(clk), 
		.row_read(row_read), 
		.col_read(col_read), 
		.pixel_out(pixel_out)
	);

	initial begin
		$monitor("input = %d, in_row = $d, in_col = %d, output = %d, out_row = %d, out_col = %d",
					pixel_result, pixel_row, pixel_col, pixel_out, row_read, col_read);
		
		// Initialize Inputs
		pixel_result = 12'h_AAA;
		pixel_row = 0;
		pixel_col = 0;
		//clk = 0;
		row_read = 0;
		col_read = 0;


		#100;
		pixel_result = 12'h_BBB;
		pixel_row = 5;
		pixel_col = 3;
		row_read = 0;
		col_read = 0;

		#100;
		pixel_result = 12'h_CCC;
		pixel_row = 2;
		pixel_col = 7;
		row_read = 5;
		col_read = 3;	

		#100;
		row_read = 2;
		col_read = 7;
		
		//#90 clk = 1; // pixel_out is supposed to read 12'h_CCC
		#100 $finish;

	end
      
endmodule
