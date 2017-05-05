`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 14:25:05
// Design Name: 
// Module Name: singal3
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


module singal3(
    input[31:0] singal,
    output J,
    output jal,
    output Jr,
    output beq,
    output bne,
    output MemRead,
    output MemtoReg,
    output MemWrite,
    output RegWrite,
    output sys,
    output srav,
    output lui,
    output sb,
    output bgtz
    );
    
    assign  
            J = singal[3],
            jal = singal[4],
            Jr = singal[5],
            beq = singal[6],
            bne = singal[7],
            MemRead = singal[8],
            MemtoReg = singal[9],
            MemWrite = singal[10],
            RegWrite = singal[11],
            sys = singal[17],
            srav = singal[18],
            lui = singal[19],
            sb = singal[20],
            bgtz = singal[21];    
endmodule
