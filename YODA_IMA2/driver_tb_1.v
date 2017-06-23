`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:53:47 06/22/2017
// Design Name:   driver
// Module Name:   /home/bluelabuser/Desktop/John/YODA_Image_Masking_Accelerator/YODA_IMA2/driver_tb_1.v
// Project Name:  YODA_IMA2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module driver_tb_1;

	// Inputs
	reg clk_driver;

	// Instantiate the Unit Under Test (UUT)
	driver uut (
		.clk_driver(clk_driver)
	);

	initial begin
		// Initialize Inputs
		
		// Wait 100 ns for global reset to finish
		#100;
		#100 $finish;
		// Add stimulus here

	end
      
endmodule

