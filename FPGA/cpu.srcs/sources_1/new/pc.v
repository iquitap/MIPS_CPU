`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 19:54:43
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input clear,
    input enable,   
    input [31:0] pc_in,
    output reg [31:0] pc_out
    );
    initial 
    begin
        pc_out <= 0;
    end
    always@(posedge clk)
    begin
        if(clear)
            pc_out<=0;
        else if(enable)
            pc_out<=pc_in;
    end
endmodule
