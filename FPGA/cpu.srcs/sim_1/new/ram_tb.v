`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 09:57:43
// Design Name: 
// Module Name: ram_tb
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


module ram_tb(

    );
    reg [31:0] Address;
    reg [31:0] DataIn;
    reg sb3, MemWrite3,MemRead3,clk;
    wire [31:0] reddate;
    wire [31:0] DataOut;
    /*wire sel0,sel1,sel2,sel3;
    wire [7:0] data0_out;
    wire [7:0] data1_out;
    wire [7:0] data2_out;
    wire [7:0] data3_out;
    wire [23:0] memaddr;*/
    ram DUT(Address,DataIn,sb3, MemWrite3,MemRead3,clk, reddate,DataOut);
    initial 
    begin
        clk = 0;MemRead3 = 1;MemWrite3 = 0;DataIn = 0;Address = 0;sb3=0;
        #10;DataIn = 4;MemWrite3= 1;
        #50;Address = 2; sb3 = 1; DataIn = 2;
        #100 sb3 = 0;
    end
       
    always
    begin
        #2;clk = ~clk;
    end
endmodule
