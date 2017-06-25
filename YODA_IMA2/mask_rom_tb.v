`timescale 1ns / 1ps

// test bench for the mask brom
module mask_rom_tb;

	// Inputs
	reg [6:0] row;
	reg [7:0] col;

	// Outputs
	wire [11:0] color_data;

	// Instantiate the Unit Under Test (UUT)
	mask_rom uut (
		.row(row), 
		.col(col), 
		.color_data(color_data)
	);

	initial begin
		$monitor("data = %d, row = %d, col = %d", color_data, row, col);
		// Initialize Inputs
		row = 0;
		col = 0;

		// Wait 100 ns for global reset to finish
		#50 col = 7'b_0101_1000; row = 8'b_001_0101;	// line 3835 in the mask rom module
		#50 col = 7'b_0101_1001; row = 8'b_001_0101;	// line 3836
		#50 col = 7'b_1000_0100; row = 8'b_011_1011;	// line 10643
		#50 col = 7'b_0101_1000; row = 8'b_101_1110;	// line 16829
		#50 $finish;
		// Add stimulus here

	end
	
endmodule
