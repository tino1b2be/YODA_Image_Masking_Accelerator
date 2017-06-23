`include "utils.v"

module imm 
	(
	
	// ------ inputs --------
    input 					clk,
    input	[11:0]		image_pixel,
    input	[7:0]			pixel_row,
    input	[8:0]			pixel_col,
    input	[7:0]			mask_row_offset,
    input	[8:0]			mask_col_offset,
	
	// ------ outputs --------	
	 output reg	[7:0]		pixel_row_out,
	 output reg	[8:0]		pixel_col_out,
    output reg	[11:0]	pixel_result
	);

  // ----------- registers to store the iputs and connect the output wires.
  
    reg  [11:0]	image_pixel_reg;
    reg  [7:0]		pixel_row_reg;
    reg  [8:0]		pixel_col_reg;
    reg  [7:0]		mask_row_offset_reg;
    reg  [8:0]		mask_col_offset_reg;
	 reg  [6:0]		mask_row;
	 reg  [7:0]		mask_col;
	 wire [11:0]	mask_pixel_reg;
	 
	 // instantiate the BROM that stores the mask.
	 
	 mask_rom mask(
	   .row(mask_row),					// mask row address line
		.col(mask_col),					// mask col address line
		.color_data(mask_pixel_reg)	// mask pixel output bus
	 );
  
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
	 
	 // set the output lines for the 
	 assign pixel_row_out = pixel_row_reg;
	 assign pixel_col_out = pixel_col_reg;
	 
    if (pixel_row_reg >= mask_row_offset_reg
        && pixel_row_reg < (mask_row_offset_reg + `MASK_WIDTH)			
        && pixel_col_reg >= mask_col_offset_reg
        && pixel_col_reg < (mask_col_offset_reg + `MASK_HEIGHT)
       ) begin	
      
		// TODO need a delay to get the mask pixel from BROM
      pixel_result = image_pixel_reg ^ mask_pixel_reg;
    
    end // end if inside mask
	 
	 // if the pixel is not inside the mask
    else begin
		
		pixel_result = image_pixel_reg;
		
    end // end else outside mask
    
  end // end of always block
  
endmodule
