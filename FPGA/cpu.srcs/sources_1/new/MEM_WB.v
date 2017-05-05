`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 19:34:37
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input clk,  
    input nop,
    input clear,
    input [31:0] pc_next_in,
    input [4:0] writereg_in,
    input [31:0] writeback_in,
    input jal_in,
    input lui_in,
    input MemtoReg_in,
    input sys_in,
    input Regwrite_in,
    input mfc0_in,
    output reg [31:0]pc_next_out,
    output reg [4:0]writereg_out,
    output reg [31:0]writeback_out,
    output reg jal_out,
    output reg lui_out,
    output reg MemtoReg_out,
    output reg sys_out,
    output reg Regwrite_out,
    output reg mfc0_out
    );
    initial
    begin
        pc_next_out <= 0;
        writereg_out <= 0;
        writeback_out <= 0;
        jal_out <= 0;
        lui_out <= 0;
        MemtoReg_out <= 0;
        sys_out <= 0;
        Regwrite_out <= 0; 
        mfc0_out <= 0;   
    end
    
    always@(posedge clk)
    begin
        if(~nop)
        begin
            if(clear)
            begin
                pc_next_out <= 0;
                writereg_out <= 0;
                writeback_out <= 0;
                jal_out <= 0;
                lui_out <= 0;
                MemtoReg_out <= 0;
                sys_out <= 0;
                Regwrite_out <= 0;
                mfc0_out <= 0;
            end
            else
            begin
                pc_next_out <= pc_next_in;
                writereg_out <= writereg_in;
                writeback_out <= writeback_in;
                jal_out <= jal_in;
                lui_out <= lui_in;
                MemtoReg_out <= MemtoReg_in;
                sys_out <= sys_in;
                Regwrite_out <= Regwrite_in;
                mfc0_out <= mfc0_in;
            end
        end
    end    
endmodule
