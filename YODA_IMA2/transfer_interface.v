module transfer_interface(Clock, pixel_in, row_sel, col_sel, pixel_out, pix_row, pix_col, strobe);
input Clock;
input [11:0] pixel_in;

output [11:0] pixel_out;
output [8:0] pix_row;
output [7:0] pix_col;
output [8:0] row_sel;
output [7:0] col_sel;
output strobe;


reg strobe;
reg mode = 0; // mode = 0: row_sel and col_sel set for BRAM		mode = 1: infor written to IMM
reg [11:0] pixel_out;
reg [8:0] row_count = 0;
reg [7:0] col_count = 0;
reg [8:0] pix_row;
reg [7:0] pix_col;
reg [8:0] row_sel;
reg [7:0] col_sel;

	always @(posedge Clock) begin
		if(mode == 0) begin
			strobe = 0;
			row_sel = row_count;
			col_sel = col_count;
			mode = 1;
		end
		else begin
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
			
			mode = 0;
			strobe = 1;
		end
		
		
	end 
endmodule