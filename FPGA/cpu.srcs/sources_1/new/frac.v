`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 22:55:05
// Design Name: 
// Module Name: frac
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


module frac(
    input clk_in,
    input clear,
    output reg clk_display,
    output reg clk_cpu
);
    reg [19:0] count_display;            
    reg [31:0] count_cpu;

always @(posedge clk_in,posedge clear)
begin 
    if(clear)
    begin
        count_display<=0;
        count_cpu<=0;
    end
    else
    begin  
        if(count_cpu==900000)
        begin
            clk_cpu<=1;
            count_cpu<=0;
        end
        else
        begin
            clk_cpu<=0;
            count_cpu<=count_cpu+1;
        end

        if(count_display==100000)
        begin
            clk_display<=1;
            count_display<=0;
        end    
        else
        begin
            clk_display<=0;
            count_display<=count_display+1;
        end      
    end
end 
endmodule
