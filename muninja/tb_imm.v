`timescale 1 ns / 1 ps
  
module imm_tb;

	reg [11:0]	pixel;
   reg [8:0]	i_p;
   reg [7:0]	j_p;
   reg [8:0]	i_offset;
   reg [7:0]	j_offset;
   reg			Tx;
	
	wire [11:0]	pixel_result;
	
	imm uut(
		.pixel(pixel),
		.i_p(i_p),
		.j_p(j_p),
		.i_offset(i_offset),
		.j_offset(j_offset),
		.Tx(Tx),
		.pixel_result(pixel_result)
	);
	
	initial begin
		$monitor("pixel=%d, result=%d, Tx=%d",pixel, pixel_result, Tx);
		
		pixel		= 12'h_FFF;
		i_p		= 0;
		j_p		= 0;
		i_offset	= 0;
		j_offset	= 0;
		Tx			= 0;
	
		#100;
		
		#50 Tx = 1;
		
		#100 $finish;
	end
	
endmodule
