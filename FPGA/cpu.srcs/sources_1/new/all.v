`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 22:51:09
// Design Name: 
// Module Name: all
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


module all(
    input clk,
    input clear,
    input choose,
    input IR0,
    input IR1,
    input IR2,
    output [7:0] control,
    output [7:0] out,
    output [1:0] iterNo
 );
    wire [31:0] count_out,display_out,temp_out;
    wire clk_display,clk_cpu,clk_cpu_temp;
    wire [3:0] decipher_in;
    assign clk_cpu_temp = (clear==1'b1) ? 1'b0 :clk_cpu;
    frac frac_(clk,clear,clk_display,clk_cpu);
    main main_(clk_cpu_temp, IR0, IR1, IR2, count_out,display_out,iterNo );
    choose choose_(display_out,count_out,choose,temp_out);
    scan scan_(clk_display,temp_out,control,decipher_in); 
    display display_(decipher_in,out);  
endmodule
