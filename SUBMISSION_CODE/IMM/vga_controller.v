`timescale 1ns / 1ps
`include "utils.v"

module vga_controller
	(
	input						clk,
	input			[11:0]	ram_pixel,

	output					vga_vs,
	output					vga_hs,
	output 		[3:0]		vga_r,
	output 		[3:0]		vga_g,
	output 		[3:0]		vga_b,
	output reg	[7:0] 	row_read,
	output reg 	[8:0] 	col_read	
	);
	
	// video structure constants
	
	parameter hpixels = 800;// horizontal pixels per line
	parameter vlines = 521; // vertical lines per frame
	parameter hpulse = 96; 	// hsync pulse length
	parameter vpulse = 2; 	// vsync pulse length
									// +++ changed from hbp=144 to below to accomodate screen
	parameter hbp = 50; 		// end of horizontal back porch
	parameter hfp = 784; 	// beginning of horizontal front porch
									// +++ changed from vbp=31 to below to accomodate screen
	parameter vbp = 15; 		// end of vertical back porch
	parameter vfp = 511; 	// beginning of vertical front porch
									// active horizontal video is therefore: 784 - 144 = 640
									// active vertical video is therefore: 511 - 31 = 480
	
	// wires to access pixels on the screen
	wire [9:0] hc,vc;
	wire	hFree;	// not used anymore
	wire	vFree;	// not used anymore
	
	assign vga_r = ram_pixel[11:8];	// red starts at the MSB
	assign vga_g = ram_pixel[7:4];
	assign vga_b = ram_pixel[3:0];	// blue is at the LSB side
	
	always@(*)begin
		
		// first check if we are inside the 320x240 area for the image
			if (vc >= vbp
				&& vc < (vbp + `IMAGE_HEIGHT)
				&& hc >= hbp
				&& hc < (hbp + `IMAGE_WIDTH)
				) begin
			
				// set the row and column addresses for the VGA_RAM_BUFFER
				row_read = vc - vbp;
				col_read = hc - hbp;
				
			end
			// we're outside active vertical range so display black
			else
			begin
				row_read = 0;
				col_read = 0;
			end
		end
			
	vgaPulse H(pixelClk,hpulse,hbp,hfp,hpixels,vga_hs,hFree,hc);
	vgaPulse V(vga_hs,vpulse,vbp,vfp,vlines,vga_vs,vFree,vc);
	clockDiv pixelClock(clk,32'd4,pixelClk);
endmodule
	
module vgaPulse(clk,stage1,stage2,stage3,endStage,syncPulse,free,position);

	reg [12:0] count;
	reg inc;
	reg[10:0] posCount;
	output [10:0] position;
	assign position=posCount;
	input [21:0] stage1,stage2,stage3,endStage;
	input clk;

	//wether the count is in each stage
	reg S0,S1,S2,S3;
	output  syncPulse,free;
	//free if and only if in stage 0
	assign free=fr;
	//sync is high if in stage 0 1 or 3
	assign syncPulse=sp;
	reg fr,sp;

	always@(*)begin

	inc=(count>endStage);
	//stage0
	S0<=(((count>21'd0)||(count==21'd0))&&(count<stage1)||(count==endStage));
	//stage1
	S1<=(((count>stage1)||(count==stage1))&&(count<stage2));
	//stage2
	S2<=(((count>stage2)||(count==stage2))&&(count<stage3));
	//stage3
	S3<=(((count>stage3)||(count==stage3))&&(count<endStage));
	//free if and only if in stage 0

	end

	always@(negedge clk)begin
	
	//free if and only if in stage 0
	fr<=S2;
	//sync is high if in stage 0 1 or 3
	sp<=S1||S2||S3;
	end

	//at the clock edge
	always@(posedge clk) begin
		case(free)
			0:posCount=0;
			1:posCount=posCount+1;
		endcase
		
		case(inc)
			1:count=0;
			0:count=count+1;
		endcase
	end
endmodule
