`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/09 21:24:26
// Design Name: 
// Module Name: ie
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


module ie(
    input clk,
    input d_in,
    input MTC0, 
    input [4:0]r_n,
    input INT1,
    output reg IE_out
    );
    initial 
    begin
        IE_out = 1'b0 ;
    end
    always@(posedge clk)
    begin
        if(INT1)
            IE_out <= 1'b1;
        else if(MTC0 && r_n==1)
            IE_out<= d_in;
    end
endmodule
