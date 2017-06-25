`include "utils.v"

module imm 
	(
	
	// ------ inputs --------
    input 					clk,
    input	[11:0]		image_pixel, mask_pixel, 	// image pixel from the transfer module and mask pixel from the mask_brom
    input	[7:0]			pixel_row,						// pixel row address
    input	[8:0]			pixel_col,						// pixel col address
    input	[7:0]			mask_row_offset,
    input	[8:0]			mask_col_offset,
	
	// ------ outputs --------	
	
	 output reg	[7:0]		pixel_row_out,					// pixel address to vga_ram
	 output reg	[8:0]		pixel_col_out,
	 output reg [6:0]		mask_row,						// mask pixel address to the mask_brom
	 output reg [7:0]		mask_col,
    output reg	[11:0]	pixel_result					// the result of the masking process (if masked)
	);

  // ----------- registers to store the iputs and connect the outputs.
    reg  [11:0]	image_pixel_reg;
    reg  [7:0]		pixel_row_reg;
    reg  [8:0]		pixel_col_reg;
    reg  [7:0]		mask_row_offset_reg;
    reg  [8:0]		mask_col_offset_reg;
	 
  // update registeres when clocked
  always @(posedge clk) begin
		image_pixel_reg		<= image_pixel;
		pixel_row_reg			<= pixel_row;
		pixel_col_reg			<= pixel_col;
		mask_row_offset_reg 	<= mask_row_offset;
		mask_col_offset_reg 	<= mask_col_offset;
  end
  
  // process the pixel 
  always @(*) begin
	 
	 // calculate the row and col addresses for the mask and fetch the mask_pixel
	 mask_row 		= (pixel_row_reg - mask_row_offset_reg);
	 mask_col 		= (pixel_col_reg - mask_col_offset_reg);
	 
	 // set the output address lines to be read by the vga_buffer
	 pixel_row_out = pixel_row_reg;
	 pixel_col_out = pixel_col_reg;
	 
	 // check if the pixel is within the masking area.
    if (pixel_row_reg >= mask_row_offset_reg
        && pixel_row_reg < (mask_row_offset_reg + `MASK_WIDTH)			
        && pixel_col_reg >= mask_col_offset_reg
        && pixel_col_reg < (mask_col_offset_reg + `MASK_HEIGHT)
       ) begin	
      
		// TODO need a delay to get the mask pixel from BROM
      pixel_result = image_pixel_reg ^ mask_pixel;
    
    end // end if inside mask
	 
	 // if the pixel is not inside the mask
    else begin
		
		pixel_result = image_pixel_reg;
		
    end // end else outside mask
    
  end // end of always block
  
endmodule // imm
