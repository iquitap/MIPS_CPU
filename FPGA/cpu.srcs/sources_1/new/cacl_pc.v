`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 14:30:24
// Design Name: 
// Module Name: cacl_pc
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


module cacl_pc(
    input equal,
    input bne,
    input beq,
    input [27:0] ins_shift,
    input [31:0] pc,    
    input j,
    input jal,
    input bgtz,
    input jr,
    input [31:0] R12,
    input [31:0] im,
    input [31:0] X,
    input [31:0] pc_40,
    input pcc,
    output branch,
    output [31:0] new_pc
    );
    wire [31:0]temp1,temp2,temp3,temp4,temp5,temp6;
    wire temp_s;
    assign  temp1 = {pc[31:28],ins_shift[27:0]},
            temp2 = im << 2,
            branch = (equal&beq)|(~equal&bne);
    mux2_1 mux1_(pc,pc+temp2,branch,temp3);
    mux2_1 mux2_(temp3,temp1,j|jal,temp4);
    mux2_1 mux3_(temp4,R12,jr,temp5);
    assign temp_s = bgtz & ( X==32'b0 ? 1'b1 : 1'b0);
    mux2_1 mux4_(temp5 ,pc+temp2 ,temp_s , temp6);
    mux2_1 mux5_(pc_40,temp6,pcc,new_pc);             
            
            
            
            
            
endmodule
