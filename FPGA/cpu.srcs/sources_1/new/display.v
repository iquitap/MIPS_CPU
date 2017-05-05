`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 22:56:26
// Design Name: 
// Module Name: display
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


module display(
    input [3:0] in,
output reg [7:0] out 
);
always @(in) 
begin
    case(in)        
        4'b0000:out = 8'hc0;
        4'b0001:out = 8'hf9;
        4'b0010:out = 8'ha4;
        4'b0011:out = 8'hb0;
        4'b0100:out = 8'h99;
        4'b0101:out = 8'h92;
        4'b0110:out = 8'h82;
        4'b0111:out = 8'hf8;
        4'b1000:out = 8'h80;
        4'b1001:out = 8'h90;
        4'b1010:out = 8'h88;
        4'b1011:out = 8'h83;
        4'b1100:out = 8'hc6;
        4'b1101:out = 8'ha1;
        4'b1110:out = 8'h86;
        4'b1111:out = 8'h8e;
    endcase
end
endmodule
