`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/10 13:15:09
// Design Name: 
// Module Name: rom0_tb
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


module rom0_tb(

    );
    reg [9:0] addr;
    reg sel;
    wire [31:0]instruction;
    rom0 DUT (addr, sel, instruction );
    initial
    begin
        addr = 10'h023;
        sel = 1'b1;
    end
endmodule
