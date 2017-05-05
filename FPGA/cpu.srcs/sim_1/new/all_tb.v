`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 23:02:17
// Design Name: 
// Module Name: all_tb
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


module all_tb(

    );
    reg clk;
    reg clear;
    reg choose;
    reg IR0;
    reg IR1;
    reg IR2;
    wire [7:0] control;
    wire [7:0] out;
    
    all DUT(clk, clear, choose  ,IR0, IR1 ,IR2 ,control ,out);
    initial 
    begin
        clk = 1'b0;clear=1'b0;choose=1'b1;
        IR0 = 0; IR1 = 0; IR2 = 0;
        #50 choose = 1'b0;
        #50 choose = 1'b1;
    end
    
    always
    begin
        #0.1 clk=~clk;
    end
endmodule
