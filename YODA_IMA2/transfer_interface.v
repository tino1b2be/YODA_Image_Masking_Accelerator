`include "utils.v"

module transfer_interface(
input Clock,

output reg [11:0] pixel_out,
output reg [7:0] pix_row,
output reg [8:0] pix_col
);

reg strobe_reg;
wire [11:0] pixel_in_reg;
reg [11:0] pixel_out_reg;
reg [7:0] row_count = 0;
reg [8:0] col_count = 0;
reg [7:0] pix_row_reg;
reg [8:0] pix_col_reg;

	// instantiate the BROM that stores the image.
	 
	image_rom image(
		.row(row_count),					// image row address line
		.col(col_count),					// image col address line
		.color_data(pixel_in_reg)	// mask pixel output bus
	);
	
	always @(posedge Clock) begin
		col_count = col_count + 1;
		if(col_count > `IMAGE_WIDTH) // TODO Replace with actual column width
		begin
			col_count = 0;
			row_count = row_count + 1;
			if(row_count > `IMAGE_HEIGHT) // TODO Replace with actual row size
			begin
				row_count = 0;
			end
		end
	end
	
	always @(*) begin
		pixel_out = pixel_in_reg;
		pix_row = row_count;
		pix_col = col_count;
		
	end
endmodule