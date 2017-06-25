`include "utils.v"
// transfer interface module to simulate recieving data from the CPU
module transfer_interface(
	input 				Clock,
	input		  [11:0] rom_pixel,	// pixel sent to image masking module
	
	output reg [11:0] pixel_out,	// pixel sent to image masking module
	output reg [7:0] 	pix_row,		// row address sent to the imm
	output reg [8:0] 	pix_col,		// col address sent to the imm module
	output reg [7:0] 	rom_pix_row,	// row address sent to the imm
	output reg [8:0] 	rom_pix_col	// col address sent to the imm module
	
	);

	reg [7:0] row_count = 0;
	reg [8:0] col_count = 0;
	
	// calculate the row and col addresses of the pixels to be read from rom
	always @(posedge Clock) begin
		col_count = col_count + 1;
		if(col_count > `IMAGE_WIDTH)
		begin
			col_count = 0;
			row_count = row_count + 1;
			if(row_count > `IMAGE_HEIGHT)
			begin
				row_count = 0;
			end
		end
	end
	
	always @(*) begin
		rom_pix_col = col_count;
		rom_pix_row = row_count;
		pixel_out = rom_pixel;
		pix_row = row_count;
		pix_col = col_count;
	end
endmodule