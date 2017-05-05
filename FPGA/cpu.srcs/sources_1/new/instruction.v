`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 14:56:49
// Design Name: 
// Module Name: instruction
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


module instruction(
    input [9:0] addr,
    input enable,
    input [1:0] iterNo,
    output [31:0] instruction
    );
    wire sel0, sel1, sel2, sel3;
    wire [31:0]instruction0, instruction1, instruction2, instruction3; 
    assign sel0 = (iterNo==2'b00)?enable:0,
           sel1 = (iterNo==2'b01)?enable:0,
           sel2 = (iterNo==2'b10)?enable:0,
           sel3 = (iterNo==2'b11)?enable:0;
    /*rom #("C:/Users/zhou/Desktop/cpu/test/benchmark.hex") rom_0(addr, sel0, instruction0 );
    rom #("C:/Users/zhou/Desktop/cpu/test/11.hex") rom_1(addr, sel1, instruction1 );
    rom #("C:/Users/zhou/Desktop/cpu/test/22.hex") rom_2(addr, sel2, instruction2 );
    rom #("C:/Users/zhou/Desktop/cpu/test/33.hex") rom_3(addr, sel3, instruction3 );*/
   // assign instruction = enable?((iterNo==2'b00)?instruction0:(iterNo==2'b01)?instruction1:(iterNo==2'b10)?instruction2:instruction3):32'b0;
    rom0 rom0_ (addr, sel0, instruction0 );
    rom1 rom1_ (addr, sel1, instruction1 );
    rom2 rom2_ (addr, sel2, instruction2 );
    rom3 rom3_ (addr, sel3, instruction3 );
    assign instruction = (iterNo==2'b00)?instruction0:(iterNo==2'b01)?instruction1:(iterNo==2'b10)?instruction2:instruction3;
endmodule
