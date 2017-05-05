`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/09 10:12:05
// Design Name: 
// Module Name: iterupt_tb
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


module iterupt_tb(

    );
    reg clk;
    reg IR0_in;
    reg IR1_in;
    reg IR2_in;
    reg END_in;
    reg IE_in;
    wire INT_1;
    wire INT_2;
    //output reg x,y
    wire [1:0]intNo;
    interupt DUT(clk, IR0_in, IR1_in ,IR2_in, END_in, IE_in ,INT_1 ,INT_2,intNo);
    initial 
    begin 
        clk = 0;
        IR0_in = 0;
        IR1_in = 0;
        IR2_in = 0;
        END_in = 0;
        IE_in = 1;
        #5 IR1_in = 1;
        #10 IR2_in = 1;IR0_in=1;
        #1 IR0_in = 0;IR1_in = 0;IR2_in = 0;
        #5 END_in = 1;
        #2 END_in = 0;
    end
    
    always
    begin
        #0.1 clk = ~clk;
    end
endmodule
