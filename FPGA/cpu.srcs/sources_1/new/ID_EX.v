`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 18:40:52
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input clk,
    input nop,
    input clear,
    input [27:0] ins_shift_in,
    input [31:0] pc_in,
    input [31:0] ins_in,
    input [31:0] singal_in, 
    input [31:0] R1_in,
    input [31:0] R2_in,
    input [4:0] writereg_in,
    input [31:0] zero_extent_in,
    input [31:0] extent_in,
    output reg [27:0] ins_shift_out,
    output reg [31:0] pc_out,
    output reg [31:0] ins_out,
    output reg [31:0] singal_out,
    output reg [31:0] R1_out,
    output reg [31:0] R2_out,
    output reg [4:0]  writereg_out,
    output reg [31:0] zero_extent_out,
    output reg [31:0] extent_out
    );
    
    initial
    begin
        ins_shift_out <= 0;
        pc_out <= 0;
        ins_out <= 0;
        singal_out <= 0;
        R1_out <= 0;
        R2_out <= 0;
        writereg_out <= 0;
        zero_extent_out <= 0;
        extent_out <= 0;    
    end
    
    always@(posedge clk)
    begin
        if(~nop)
        begin
            if(clear)
            begin
                ins_shift_out <= 0;
                pc_out <= 0;
                ins_out <= 0;
                singal_out <= 0;
                R1_out <= 0;
                R2_out <= 0;
                writereg_out <= 0;
                zero_extent_out <= 0;
                extent_out <= 0;
            end
            else
            begin
                ins_shift_out <= ins_shift_in;
                pc_out <= pc_in;
                ins_out <= ins_in;
                singal_out <= singal_in;
                R1_out <= R1_in;
                R2_out <= R2_in;
                writereg_out <= writereg_in;
                zero_extent_out <= zero_extent_in;
                extent_out <= extent_in;
            end
        end
    end    
endmodule
