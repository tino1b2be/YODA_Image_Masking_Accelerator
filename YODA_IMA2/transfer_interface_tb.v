`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:56:44 06/22/2017
// Design Name:   transfer_interface
// Module Name:   /home/bluelabuser/Desktop/John/YODA_Image_Masking_Accelerator/YODA_IMA2/transfer_interface_tb.v
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

module transfer_interface_tb;

	// Inputs
	reg Clock;

	// Outputs
	wire [11:0] pixel_out;
	wire [7:0] pix_row;
	wire [8:0] pix_col;

	// Instantiate the Unit Under Test (UUT)
	transfer_interface uut (
		.Clock(Clock), 
		.pixel_out(pixel_out), 
		.pix_row(pix_row), 
		.pix_col(pix_col)
	);

	initial begin
		$monitor("clock = %d, pixel out = %d, row = %d, column = %d", Clock, pixel_out, pix_row, pix_col);
		// Initialize Inputs
		Clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
            
		// Add stimulus here
		
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
		
		#100 $finish;
	end
      
endmodule
