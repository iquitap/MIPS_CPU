`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/09 08:55:57
// Design Name: 
// Module Name: interupt
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


module interupt(
    input clk,  
    input IR0_in,
    input IR1_in,
    input IR2_in,
    input END_in,
    input IE_in,
    output reg INT_1,
    output reg INT_2,
    //output reg x,y
    output [1:0]intNo
    );
    reg x,y;
    wire IM0,IM1,IM2;
    wire IR0_clr,IR1_clr,IR2_clr;
    reg INT_clr;
    reg IR0_reg,IR1_reg,IR2_reg;
    reg INT_1_2;
    assign intNo[0] = y,
           intNo[1] = x;
    initial begin
        INT_1<=0;INT_2<=0;INT_clr<=0;x<=0;y<=0;
        IR0_reg<=0;IR1_reg<=0;IR2_reg<=0;
        
        INT_1_2 = 0;
    end
    assign IR0_clr=({x,y}==2'b01)?END_in:0,
        IR1_clr=({x,y}==2'b10)?END_in:0,
        IR2_clr=({x,y}==2'b11)?END_in:0,
        IM0=IR0_reg|IR1_reg|IR2_reg,
        IM1=IR1_reg|IR2_reg,
        IM2=IR2_reg;
    //register #(1) int_reg_(clk,0,1,INT_1,INT_2);
    always@(posedge clk)
    begin
        INT_1_2 <= INT_1;
    end
    always@(negedge clk)
    begin
        INT_2 <= INT_1_2;
    end
    
    always@(negedge clk)
    begin
        INT_clr=INT_1;
    end
    always@(posedge clk)
    begin
        if(IR0_clr) IR0_reg=0;
        else if(IR0_in) IR0_reg=1;
        if(IR1_clr) IR1_reg=0;
        else if(IR1_in) IR1_reg=1; 
        if(IR2_clr) IR2_reg=0;
        else if(IR2_in) IR2_reg=1;
        
        
        if(INT_clr)
            INT_1=0;
        else
            INT_1=(IR0_reg & ~IM0|IR1_reg & ~IM1|IR2_reg & ~IM2) & IE_in;
        
        if(END_in|INT_1)
        begin
            x=0;y=0;
        end
        else begin
            if((IR2_reg|~IR2_reg&IR1_reg)&IE_in)
                x=1;
            if((IR2_reg|~IR2_reg&~IR1_reg&IR0_reg)&IE_in)
                y=1;
        end
    end
endmodule