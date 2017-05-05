`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 19:07:34
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    input clk,  
    input nop,
    input clear,
    input [31:0] singal_in,
    input [31:0] ins_in,
    input [31:0] pc_in,
    input [31:0] R1_in,
    input [31:0] result_in,
    input [4:0] writereg_in,
    input [31:0] extent_in,
    input [31:0] writeback_in,
    input mfc0_in,
    output reg [31:0] singal_out,
    output reg [31:0] ins_out,
    output reg [31:0] pc_out,
    output reg [31:0] R1_out,
    output reg [31:0] result_out,
    output reg [4:0] writereg_out,
    output reg [31:0] extent_out,
    output reg [31:0] writeback_out,
    output reg mfc0_out
    );
    initial 
    begin
        singal_out <= 0;
        ins_out <= 0;
        pc_out <= 0;
        R1_out <= 0;
        result_out <= 0;
        writereg_out <= 0;
        extent_out <= 0;
        writeback_out <= 0;  
        mfc0_out <= 0;     
    end
    
    always@(posedge clk)
    begin
        if(~nop)
        begin
            if(clear)
            begin
                singal_out <= 0;
                ins_out <= 0;
                pc_out <= 0;
                R1_out <= 0;
                result_out <= 0;
                writereg_out <= 0;
                extent_out <= 0;
                writeback_out <= 0;
                mfc0_out <= 0;
            end
            else
            begin
                singal_out <= singal_in;
                ins_out <= ins_in;
                pc_out <= pc_in;
                R1_out <= R1_in;
                result_out <= result_in;
                writereg_out <= writereg_in;
                extent_out <= extent_in;
                writeback_out <= writeback_in;
                mfc0_out <= mfc0_in;
            end
        end
    end    
endmodule
