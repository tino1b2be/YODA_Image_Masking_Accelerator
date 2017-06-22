`timescale 1ns / 1ps

module vga_controller(clk,vga_vs,vga_hs,vga_r,vga_g,vga_b,r,g,b,vFree,hFree);

	input  clk;
	input [3:0] r,g,b;
	output  vga_vs,vga_hs,hFree,vFree;
	output reg [3:0] vga_r,vga_g,vga_b;
	reg [3:0] free;
	wire [9:0] hc,vc;
	
	// video structure constants
	parameter hpixels = 800;// horizontal pixels per line
	parameter vlines = 521; // vertical lines per frame
	parameter hpulse = 96; 	// hsync pulse length
	parameter vpulse = 2; 	// vsync pulse length
	//changed from hbp=144 to below to accomodate screen
	parameter hbp = 50; 	// end of horizontal back porch
	parameter hfp = 784; 	// beginning of horizontal front porch
	//changed from vbp=31 to below to accomodate screen
	parameter vbp = 15; 		// end of vertical back porch
	parameter vfp = 511; 	// beginning of vertical front porch
	// active horizontal video is therefore: 784 - 144 = 640
	// active vertical video is therefore: 511 - 31 = 480
	
	always@(*)begin
		// reset condition
//		if (clr == 1)
//		begin
//			hc <= 0;
//			vc <= 0;
//		end
//		
			// first check if we're within vertical active video range
			if (vc >= vbp && vc < vfp)
			begin
				// now display different colors every 80 pixels
				// while we're within the active horizontal range
				// -----------------
				// display white bar
				if (hc >= hbp && hc < (hbp+80))
				begin
					vga_r = 4'b1111;
					vga_g = 4'b1111;
					vga_b = 4'b1111;
				end
				// display yellow bar
				else if (hc >= (hbp+80) && hc < (hbp+160))
				begin
					vga_r = 4'b1111;
					vga_g = 4'b1111;
					vga_b = 4'b0000;
				end
				// display cyan bar
				else if (hc >= (hbp+160) && hc < (hbp+240))
				begin
					vga_r = 4'b0000;
					vga_g = 4'b1111;
					vga_b = 4'b1111;
				end
				// display green bar
				else if (hc >= (hbp+240) && hc < (hbp+320))
				begin
					vga_r = 4'b0000;
					vga_g = 4'b1111;
					vga_b = 4'b0000;
				end
				// display magenta bar
				else if (hc >= (hbp+320) && hc < (hbp+400))
				begin
					vga_r = 4'b1111;
					vga_g = 4'b0000;
					vga_b = 4'b1111;
				end
				// display red bar
				else if (hc >= (hbp+400) && hc < (hbp+480))
				begin
					vga_r = 4'b1111;
					vga_g = 4'b0000;
					vga_b = 4'b0000;
				end
				// display blue bar
				else if (hc >= (hbp+480) && hc < (hbp+560))
				begin
					vga_r = 4'b0000;
					vga_g = 4'b0000;
					vga_b = 4'b1111;
				end
				// display black bar
				else if (hc >= (hbp+560) && hc < (hbp+640))
				begin
					vga_r = 4'b0000;
					vga_g = 4'b0000;
					vga_b = 4'b0000;
				end
				// we're outside active horizontal range so display black
				else
				begin
					vga_r = 0;
					vga_g = 0;
					vga_b = 0;
				end
			end
			// we're outside active vertical range so display black
			else
			begin
				vga_r = 0;
				vga_g = 0;
				vga_b = 0;
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


module clockDiv(clk,div,out);
	output reg out;
	input clk;
	input [31:0] div;
	reg [31:0] count;
	reg inc;
	reg outhold;
	reg max;
	//assign out=outhold;
	always begin inc=(count>max); max=div>>1;end

	always@(posedge clk)begin
		case(inc)
			1:begin count=0; out=~out; end
			0:begin count=count+1; end
		endcase
	end
endmodule


	//assign STATE = ADDRH*GimpyXY + ADDRV;
/*
	always @(posedge CLK) begin
		if (ADDRV < GimpyXY && ADDRH < GimpyXY)begin
			COLOUR_IN <= COLOUR_DATA[{STATE}];
		end
		else COLOUR_IN <= 8'hFF;
	end
	*/


//Code used to put a not moving picture on the screen
/*
Picture Gimpy (
				.X(10'd280),
				.Y(10'd200),
				.CLK(CLK),
				.ADDRH(ADDRH),
				.ADDRV(ADDRV),
				.COLOUR_OUT(),
				.BACKGROUND()
				);
module Picture (
	input [9:0] X,
	input [8:0] Y,
	input CLK,
	input [9:0] ADDRH,
	input [8:0] ADDRV,
	output reg [7:0] COLOUR_OUT,
	input [7:0] BACKGROUND
	);
	
	//parameter Mickey = 13'd6960;	//The same values as for a moving picture
	parameter Gimpy = 13'd6400;
	parameter GimpyXY = 7'd80;
	//parameter MickeyX = 7'd80;
	//parameter MickeyY = 7'd87;
	
	reg [7:0] COLOUR_OUT;	//Colours that go to VGA
	reg [7:0] COLOUR_DATA [0:Gimpy-1];	//data of colours
	wire [12:0] STATE;	
	
	initial
	$readmemh ("gimpy.list", COLOUR_DATA);
	
	assign STATE = (ADDRH-X)*GimpyXY+ADDRV-Y;	//apply formula
	
	always @(posedge CLK) begin
		if (ADDRH>=X && ADDRH<X+GimpyXY
			&& ADDRV>=Y && ADDRV<Y+GimpyXY)
				COLOUR_OUT <= COLOUR_DATA[{STATE}];
			else
				COLOUR_OUT <= BACKGROUND;
	end
	
endmodule
*/
