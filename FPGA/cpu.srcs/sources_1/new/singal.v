`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 14:06:21
// Design Name: 
// Module Name: singal
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


module singal(
    input Zero_extent,
    input RegDst,
    input shift,
    input J,
    input jal,
    input Jr,
    input beq,
    input bne,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input RegWrite,
    input ALUsrc,
    input [3:0]ALUop,
    input sys,
    input srav,
    input lui,
    input sb,
    input bgtz,
    output [31:0] singal
    );
    assign  singal[0] =  Zero_extent,
            singal[1] = RegDst ,
            singal[2] = shift,
            singal[3] = J,
            singal[4] = jal ,
            singal[5] =  Jr ,
            singal[6] = beq ,
            singal[7] = bne ,
            singal[8] = MemRead,
            singal[9] =  MemtoReg ,
            singal[10] = MemWrite,
            singal[11] = RegWrite,
            singal[12] = ALUsrc ,
            singal[13] = ALUop[0] ,
            singal[14] = ALUop[1] ,
            singal[15] =  ALUop[2] ,
            singal[16] =  ALUop[3] ,
            singal[17] = sys ,
            singal[18] = srav ,
            singal[19] = lui,
            singal[20] = sb ,
            singal[21] = bgtz;
   
endmodule
