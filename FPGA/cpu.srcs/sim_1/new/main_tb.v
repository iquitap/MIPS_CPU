`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 19:26:33
// Design Name: 
// Module Name: main_tb
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


module main_tb(

    );
    reg clkk;
    reg IR0;
    reg IR1;
    reg IR2;
    wire [31:0] out;
    wire [31:0] a0;
   // main DUT (clkk, IR0, IR1, IR2, out ,a0 , IR0_LED ,IR1_LED , IR2_LED );
    main DUT (clkk ,IR0 ,IR1, IR2, out ,a0);
   // wire [31:0] out0, out1, out2, out3;
   // main DUT (clk,out0, out1, out2, out3);
    initial
    begin
        clkk = 0;
        /*IR0 = 0;
        IR1 = 0;
        IR2 = 0;
        #5 IR1 = 1;
        #10 IR2 = 1;IR0=1;
        #1 IR0 = 0;IR1 = 0;IR2 = 0;*/
    end
    always
    begin
        #0.1 clkk = ~clkk;
    end
endmodule
