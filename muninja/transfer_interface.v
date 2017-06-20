`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:50 06/20/2017 
// Design Name: 
// Module Name:    transfer_interface 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "utils.v"
module transfer_interface(
input Clock,
input [8:0] row_select,
input [7:0] range_size, //This is dependent on the number of transfer_interfaces instances created

output [11:0] pixel,
output [9:0] row_index,
output [9:0] column_index,
output strobe
    );

reg [11:0] count;
reg [9:0] row_pointer = COL_LEN * row_select;
reg [9:0] column_pointer = 0;

always @(posedge Clock) begin
	strobe = 1;
	if (column_index > COL_LEN) // Assuming column length
	column_index = row % COL_LEN;
	row_index = row_pointer / COL_LEN;
	pixel = 0;
	row_pointer = row_pointer + 12;


end
always @(negedge Clock) begin
strobe = 0;
end 
endmodule
