`timescale 1ns / 1ps

module image_rom_tb;

	// Inputs
	reg clk;
	reg [7:0] row;
	reg [8:0] col;

	// Outputs
	wire [11:0] color_data;

	// Instantiate the Unit Under Test (UUT)
	image_rom uut (
		.row(row), 
		.col(col), 
		.color_data(color_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		row = 0;
		col = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

