`timescale 1ns / 1ps

// test bench for the transfer interface module
module transfer_interface_tb;

	// Inputs
	reg Clock;

	// Outputs
	wire [11:0] pixel_out;
	wire [11:0] rom_pixel;
	wire [7:0] rom_pix_row;
	wire [8:0] rom_pix_col;
	wire [7:0] pix_row;
	wire [8:0] pix_col;

	image_rom image(
		.row(rom_pix_row),
		.col(rom_pix_col),
		.color_data(rom_pixel)
	);

	// Instantiate the Unit Under Test (UUT)
	transfer_interface uut (
		.Clock(Clock), 
		.rom_pixel(rom_pixel),
		.pixel_out(pixel_out), 
		.pix_row(pix_row), 
		.pix_col(pix_col),
		.rom_pix_row(rom_pix_row), 
		.rom_pix_col(rom_pix_col)
	);

	initial begin
		$monitor("clock = %d, pixel out = %d, row = %d, column = %d", Clock, pixel_out, pix_row, pix_col);
		
		// the output should be a different pixel (most of the time) at each clock pulse.
		Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 Clock = 1;
		
		#20 Clock = 0;
		
		#20 $finish;
	end
 
endmodule
