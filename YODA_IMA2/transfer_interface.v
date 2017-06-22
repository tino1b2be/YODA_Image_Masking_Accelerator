module transfer_interface(Clock, pixel_in, pixel_out, pix_row, pix_col, strobe);
input Clock;
input [11:0] pixel_in;

output [11:0] pixel_out;
output [7:0] pix_row;
output [8:0] pix_col;
output strobe;


reg strobe;
reg mode = 0; // mode = 0: row_sel and col_sel set for BRAM		mode = 1: infor written to IMM
reg [11:0] pixel_out;
reg [8:0] row_count = 0;
reg [7:0] col_count = 0;
reg [7:0] pix_row;
reg [8:0] pix_col;

	// instantiate the BROM that stores the image.
	 
	image_rom image(
		.row(row_count),					// image row address line
		.col(col_count),					// image col address line
		.color_data(pixel_in)	// mask pixel output bus
	);

	always @(*) begin
		pixel_out = pixel_in;
		pix_row = row_count;
		pix_col = col_count;
		
		col_count = col_count + 1;
		if(col_count > 6) // TODO Replace with actual column width
		begin
			col_count = 0;
			row_count = row_count + 1;
			if(row_count > 6) // TODO Replace with actual row size
			begin
				row_count = 0;
			end
		end
		if(strobe == 1) begin strobe = 0; end
		else begin strobe = 1; end
			
	end 
endmodule