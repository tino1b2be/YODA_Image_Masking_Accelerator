// mask.vh
// header files with the mask array

// include guards
`ifndef mask_
`define mask_

`define MASK_ROW_LEN 5
`define MASK_COL_LEN 5

// 5 by 5 mask
reg [11:0] mask[24:0] = {12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA, 12'h_AAA};

`endif // mask_