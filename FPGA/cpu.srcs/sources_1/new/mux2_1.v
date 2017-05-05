`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 18:00:49
// Design Name: 
// Module Name: mux2_1
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


module mux2_1
#(parameter WIDTH=32)
(
    input [WIDTH-1:0] in_0,
    input [WIDTH-1:0] in_1,
    input choose,
    output [WIDTH-1:0] out
    );
    assign out = choose?in_1:in_0;
endmodule
