`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/10 12:55:09
// Design Name: 
// Module Name: rom0
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


module rom0(
    input [9:0] addr,
    input sel,
    output [31:0]instruction
    );
    reg [31:0] mem[1023:0];

    initial 
    begin
        $readmemh("C:/Users/zhou/Desktop/cpu/test/benchmark.hex",mem);
    end
//assign instruction = sel?(mem[addr]):(32'bz);
    assign instruction = mem[addr];
endmodule
