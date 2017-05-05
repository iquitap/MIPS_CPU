`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 12:54:27
// Design Name: 
// Module Name: control
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


module control(
    input [5:0] op,
    input [5:0] f,
    output Zero_extent,
    output RegDst,
    output shift,
    output J,
    output jal,
    output Jr,
    output beq,
    output bne,
    output MemRead,
    output MemtoReg,
    output MemWrite,
    output RegWrite,
    output ALUsrc,
    output [3:0]ALUop,
    output sys,
    output srav,
    output lui,
    output sb,
    output bgtz
    );
    wire op5,op4,op3,op2,op1,op0;
    wire f5, f4,f3,f2,f1,f0;
    assign  op5 = op[5],
            op4 = op[4],
            op3 = op[3],
            op2 = op[2],
            op1 = op[1],
            op0 = op[0];
    assign  f5 = f[5],
            f4 = f[4],
            f3 = f[3],
            f2 = f[2],
            f1 = f[1],
            f0 = f[0];
    assign  Zero_extent = (~op5&~op4&op3&op2&~op1&~op0) | (~op5&~op4&op3&op2&~op1&op0) | (~op5&~op4&op3&~op2&~op1&op0),
            RegDst = ~op5 &~op4&~op3&~op2&~op1&~op0,
            shift = (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &~f1 &~f0) | (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 & ~f2 & f1& f0) | (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2&f1 &~f0),
            J = ~op5 & ~op4 & ~op3 & ~op2 & op1 &~op0,
            jal = ~op5 & ~op4 & ~op3 & ~op2 & op1 &op0,
            Jr = ~op5 & ~op4 & ~op4 & ~op3 & ~op2 & ~op1 & ~op0 & ~f5 & ~f4 & f3 & ~f2 & ~f1 & ~f0,
            beq = ~op5 & ~op4 & ~op3 & op2 & ~op1 & ~op0,
            bne = ~op5 & ~op4 & ~op3 & op2 & ~op1 & op0,
            MemRead = op5 & ~op4 & ~op3 & ~op2 & op1 & op0,
            MemtoReg = (op5 & ~op4 & ~op3 & ~op2 & op1 & op0) | (op5 & ~op4 & ~op3 & ~op2 & ~op1 & op0),
            MemWrite = (op5 & ~op4 & op3 & ~op2 & op1 & op0) | (op5 & ~op4 & op3 & ~op2 & ~op1 & ~op0),
            RegWrite = (~op5 &~op4 &op3 &~op2 &~op1 &~op0) | (~op5 &~op4 &op3 &~op2 &~op1 &op0) | (~op5 &~op4 &op3 &op2 &~op1 &~op0) | (~op5 &~op4 &op3 &op2 &~op1 &op0) | (op5 &~op4 &~op3 &~op2 &op1 &op0) | (~op5 &~op4 &op3 &~op2 &op1 &~op0) | (~op5 &~op4 &~op3 &~op2 &op1 &op0 )| (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &f5 &~f4 &~f3 &~f2 &~f1 &~f0) | (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &f5 &~f4 &~f3 &~f2 &~f1 &f0) | (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &f5 &~f4 &~f3 &f2 &~f1 &~f0)|( ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &~f1 &~f0)|( ~op5 &~op4& ~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &f1 &f0) |( ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &f1& ~f0) |(~op5 &~op4 &~op3 &~op2& ~op1& ~op0& f5 &~f4& ~f3& ~f2 &f1 &~f0 )|( ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &f5 &~f4 &~f3 &f2 &~f1& f0 )|( ~op5 &~op4 &~op3& ~op2 &~op1 &~op0 &f5 &~f4 &~f3 &f2 &f1 &f0) |( ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &f5 &~f4 &f3& ~f2 &f1 &~f0 )| (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &f5 &~f4 &f3 &~f2 &f1 &f0) | (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &f2 &f1 &f0 )|( ~op5 &~op4 &op3& op2 &op1 &op0),
            ALUsrc = (~op5 &~op4 &op3 &~op2 &~op1 &~op0) | (~op5 &~op4 &op3 &~op2 &~op1 &op0) | (~op5 &~op4 &op3 &op2 &~op1 &~op0) | ( ~op5 &~op4 &op3 &op2 &~op1 &op0) | (op5 &~op4 &~op3& ~op2 &op1 &op0) | (op5 &~op4 &op3 &~op2 &op1 &op0) | (~op5 &~op4 &op3 &~op2 &op1 &~op0) | (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &~f1 &~f0 )| ( ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &f1 &f0 )| (~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &~f3 &~f2 &f1 &~f0) | (~op5 &~op4 &op3 &op2 &op1 &op0 )|(op5 &~op4 &op3 &~op2 &~op1& ~op0),
            ALUop[3] = (~op5&~op4&op3&op2&~op1&op0 )|(~op5&~op4&op3&~op2&op1&~op0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&f2&~f1&f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&f2&f1&f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&f3&~f2&f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&f3&~f2&f1&f0),
            ALUop[2] = (~op5&~op4&op3&~op2&~op1&~op0 )|(~op5&~op4&op3&~op2&~op1&op0 )|(~op5&~op4&op3&op2&~op1&~op0 )|(op5&~op4&~op3&~op2&op1&op0 )|(op5&~op4&op3&~op2&op1&op0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&~f2&~f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&~f2&~f1&f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&f2&~f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&~f2&f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&f3&~f2&f1&f0 )|(op5&~op4&~op3&~op2&~op1&op0),
            ALUop[1] = (~op5&~op4&op3&op2&~op1&~op0 )|(~op5&~op4&op3&~op2&op1&~op0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&f2&~f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&~f5&~f4&~f3&~f2&f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&~f2&f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&f2&f1&f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&f3&~f2&f1&~f0),
            ALUop[0] = (~op5&~op4&op3&~op2&~op1&~op0 )|(~op5&~op4&op3&~op2&~op1&op0 )|(~op5&~op4&op3&op2&~op1&~op0 )|(op5&~op4&~op3&~op2&op1&op0 )|(op5&~op4&op3&~op2&op1&op0 )|(~op5&~op4&op3&~op2&op1&~op0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&~f2&~f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&~f2&~f1&f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&~f3&f2&~f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&~f5&~f4&~f3&~f2&f1&f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&f5&~f4&f3&~f2&f1&~f0 )|(~op5&~op4&~op3&~op2&~op1&~op0&~f5&~f4&~f3&f2&f1&f0 )|(op5&~op4&~op3&~op2&~op1&op0),
            sys = ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4 &f3 &f2 &~f1 &~f0,
            srav = ~op5 &~op4 &~op3 &~op2 &~op1 &~op0 &~f5 &~f4& ~f3 &f2 &f1 &f0,
            lui = ~op5 &~op4 &op3 &op2 &op1 &op0,
            sb = op5 &~op4 &op3 &~op2 &~op1 &~op0,
            bgtz = ~op5 &~op4 &~op3 &op2 &op1 &op0;

endmodule
