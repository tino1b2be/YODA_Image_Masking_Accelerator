	`timescale 1ns / 1ps

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
			$monitor("clock = %d, data = %d, row = %d, col = %d", clk, color_data, row, col);
			// Initialize Inputs
			row = 0;
			col = 0;

			// Wait 100 ns for global reset to finish
			#100 col = 7'b_0101_1000; row = 8'b_001_0101;
			#100 col = 7'b_0101_1001; row = 8'b_001_0101;
			#50  col = 7'b_0101_1000; row = 8'b_001_0101;
			#50  col = 7'b_0101_1000; row = 8'b_001_0101;
			#100 $finish;
		// Add stimulus here

	end
      
endmodule

