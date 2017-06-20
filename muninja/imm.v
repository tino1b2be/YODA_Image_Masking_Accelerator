// Image Masking Module

`include "mask.v"
`include "vga_util.v"
`include "utils.v"

module imm 
  (
    input	[11:0]	pixel,
    input	[8:0]	i_p,
    input	[7:0]	j_p,
    input	[8:0]	i_offset,
    input	[7:0]	j_offset,
    input			Tx,
    output reg	[11:0]	pixel_result
  );
  
  reg [16:0] mask_index;
  
  always @(posedge Tx) begin
    mask_index = (i_p - i_offset) * `ROW_LEN + (j_p - j_offset);
    if (i_p > i_offset
        && i_p < (i_offset + `ROW_LEN)
        && j_p > j_offset
        && j_p < (j_offset + `COL_LEN)
       ) begin
            
      pixel_result = pixel ^ mask[mask_index];
    
    end 		// end if inside mask
    else begin
      pixel_result = pixel;
    end			// end else outside mask
    
    // write the pixel result to VGA_BUFFER
    vga_buffer[(i_p*`ROW_LEN) + j_p] = pixel_result;
  end
  
endmodule