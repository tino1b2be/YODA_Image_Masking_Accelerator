`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:41 06/22/2017
// Design Name:   transfer_interface
// Module Name:   /home/bluelabuser/Desktop/John/YODA_Image_Masking_Accelerator/YODA_IMA2/toplevel_tb.v
// Project Name:  YODA_IMA2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: transfer_interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module toplevel_tb;

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

	initial begin
	$monitor("clock=%d",Clock);
		// Initialize Inputs
		Clock = 0;
		mask_row_offset = 0;
		mask_col_offset = 0;
		
		row_read = 0;
		col_read = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		#20 Clock = ~Clock;
		// Add stimulus here
		#100 $finish;
	end
      
endmodule

