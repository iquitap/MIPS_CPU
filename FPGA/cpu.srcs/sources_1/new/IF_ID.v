`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 18:15:08
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input nop,
    input clear,
    input [31:0]pc_next,
    input [31:0]ins,
    output reg [31:0]pc_next_out,
    output reg [31:0]ins_out
    );
    initial
    begin
        pc_next_out <= 0;
        ins_out <= 0;
    end
    always@(posedge clk)
    begin
        if(~nop)
        begin
            if(clear)
            begin
                pc_next_out <= 31'h0;
                ins_out <= 31'h0;
            end
            else
            begin
                pc_next_out <= pc_next;
                ins_out <= ins;
            end
        end
    end

endmodule
