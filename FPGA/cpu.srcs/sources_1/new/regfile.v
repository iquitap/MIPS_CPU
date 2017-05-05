`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 16:56:19
// Design Name: 
// Module Name: regfile
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


module regfile(
    input [4:0]r1_in,
    input [4:0]r2_in,
    input [4:0]rw_in,
    input we,
    input clk,
    input [31:0]data_in,
    output [31:0]s0,
    output [31:0]s1,
    output [31:0]s2,
    output [31:0]a0,
    output [31:0]r1_out,
    output [31:0]r2_out
    );
    reg [31:0] regfile [31:0];
    integer i;
    initial
    begin
        for(i=0;i<=31;i=i+1)
            regfile[i] = 32'b0;
    end 
    
    assign r1_out = r1_in?regfile[r1_in]:0;
    assign r2_out = r2_in?regfile[r2_in]:0;
    assign s0 = regfile[2];
    assign s1 = regfile[17];
    assign s2 = regfile[18];
    assign a0 = regfile[4];
    
    always@(negedge clk)
    begin
        if(we == 1)
            regfile[rw_in] = data_in;
    end  
endmodule
