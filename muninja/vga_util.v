// mask.vh
// header file with the VGA buffer

// include guards
`ifndef mask_
`define mask_


reg [11:0] vga_buffer[24:0] = `{12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF, 12'h_FFF};

`endif // mask_