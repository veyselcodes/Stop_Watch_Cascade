`timescale 1ns / 1ps

module Top(
    input wire clk, reset,
    input wire sw,
    output wire [3:0] an,
    output wire [7:0] seg
    );
 
wire [3:0] h0, h1, h2;
disp_hex_mux d1
(
	.clk(clk), .reset(1'b0),
	.hex3(1'h0), .hex2(h2), .hex1(h1), .hex0(h0),
	.dp_in(4'b1101),
	.an(an),
	.sseg(seg)
);    

stop_watch_cascade s1
(
	.clk(clk),
	.go(sw), .clr(reset),
	.d2(h2), .d1(h1), .d0(h0)
);

endmodule
