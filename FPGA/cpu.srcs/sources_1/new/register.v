`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 15:04:25
// Design Name: 
// Module Name: register
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


module register
#(parameter width=32)
(
    input [width-1:0]in,
    input clk,
    input clr,
    input enable,
    output reg [width-1:0]out
    );
    initial 
    begin
        out = 0;
    end
    always @(posedge clk,posedge clr)
    begin
        if(clr)
            out <= 0;
        else 
        begin
            if(enable)
                out <= in;
        end
    end
endmodule
