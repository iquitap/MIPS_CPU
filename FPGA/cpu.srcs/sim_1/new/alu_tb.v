`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 14:12:24
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(

    );
    reg [31:0] X;
    reg [31:0] Y;
    reg [3:0] ALUop;
    wire [31:0] Result;
    wire [31:0] Result2;
    wire Equal;
    alu dup(X, Y, ALUop, Result, Result2, Equal);
    
    initial
    begin
        X = 8;
        Y = 2;
        ALUop = 0;
        #10 ALUop = 1;
        #10 ALUop = 2;
        #10 ALUop = 3;
        #10 ALUop = 4;
        #10 ALUop = 5;
        X = 20;
        Y = 4;
        #10 ALUop = 6;
        #10 ALUop = 7;
        #10 ALUop = 8;
        #10 ALUop = 9;
        #10 ALUop = 10;
        #10 ALUop = 11;
        #10 ALUop = 12;
    end
endmodule
