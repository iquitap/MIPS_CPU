`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 15:00:41
// Design Name: 
// Module Name: halt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module halt(
    input [31:0]s0,
    input sys,
    input clk,
    output halt
    );
    wire temp_s;
    assign temp_s = (s0==32'ha) & (sys);
    register #(1) reg1_(temp_s, clk, 1'b0, 1'b1, halt);
endmodule
