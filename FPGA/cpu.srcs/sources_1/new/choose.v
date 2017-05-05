`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 22:55:46
// Design Name: 
// Module Name: choose
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


module choose(
    input [31:0] display_out,
    input [31:0] count_out,
    input choose,
    output [31:0] out
    );
    assign out=choose?count_out:display_out;
endmodule
