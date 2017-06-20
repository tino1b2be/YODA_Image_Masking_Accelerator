`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:22 06/20/2017
// Design Name:   imm
// Module Name:   /home/bluelabuser/muninja/muninja/imm_tb.v
// Project Name:  muninja
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: imm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module imm_tb;

	// Inputs
	reg [11:0] pixel;
	reg [8:0] i_p;
	reg [7:0] j_p;
	reg [8:0] i_offset;
	reg [7:0] j_offset;
	reg Tx;

	// Outputs
	wire [11:0] pixel_result;

	// Instantiate the Unit Under Test (UUT)
	imm uut (
		.pixel(pixel), 
		.i_p(i_p), 
		.j_p(j_p), 
		.i_offset(i_offset), 
		.j_offset(j_offset), 
		.Tx(Tx), 
		.pixel_result(pixel_result)
	);

	initial begin
		// Initialize Inputs
		pixel = 0;
		i_p = 0;
		j_p = 0;
		i_offset = 0;
		j_offset = 0;
		Tx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

