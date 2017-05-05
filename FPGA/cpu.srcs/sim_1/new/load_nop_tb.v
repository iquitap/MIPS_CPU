`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 10:15:45
// Design Name: 
// Module Name: load_nop_tb
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


module load_nop_tb(

    );
    reg [4:0]writereg2;
    reg [4:0]rs;
    reg [4:0]rt;
    reg shift;
    reg ALUsrc;
    reg Regwrite2;
    reg MemtoReg;
    reg [4:0]writereg3;
    reg Regwrite3;
    reg clk;
    wire load_nop;
    wire from1r1;
    wire from1y;
    wire from1r2;
    wire from2r1;
    wire from2y;
    wire from2r2;
    /*wire temp1;
    wire temp2;
    wire temp3;
    wire temp4;
    wire temp5;
    wire temp6;
    wire temp7;
    wire temp8;
    wire temp9;
    wire temp10;
    wire temp11;
    wire temp12;
    wire temp13;
    wire temp14;
    wire temp_from1r1;
    wire temp_from1y;
    wire temp_from1r2;
    wire temp_from2r1;
    wire temp_from2y;
    wire temp_from2r2;
    wire temp_from1r1_reg;*/
    load_nop DUT( writereg2, rs, rt, shift, ALUsrc, Regwrite2, MemtoReg, writereg3, Regwrite3, clk, load_nop, from1r1, from1y, from1r2, from2r1, from2y, from2r2
            /*,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13,temp14,temp_from1y,temp_from1r2,temp_from2r1,temp_from2y,temp_from2r2,temp_from1r1_reg,temp_from1y_reg,temp_from1r2_reg,temp_from2r1_reg,temp_from2y_reg,temp_from2r2_reg*/);
    initial
    begin
        clk = 1'b0;
        writereg2 = 5'b0;
        rs = 5'b0;
        rt = 5'b0;
        shift = 1'b1;
        ALUsrc = 1'b1;
        Regwrite2 = 1'b0;
        MemtoReg = 1'b0;
        writereg3 = 5'b0;
        Regwrite3 = 1'b0;
        #0.3 rt = 5'h11;shift = 1'b0;ALUsrc = 1'b1;Regwrite2 = 1'b1;MemtoReg = 1'b0;
        #0.2 writereg2 = 5'h11;rs=5'h11;rt=5'h11;Regwrite3 = 1'b1;
        #0.2 rt = 5'h12;Regwrite2 = 1'b0;writereg3=5'h11;
        #0.2 writereg2 = 5'h12;rs=5'h12;rt=5'h12;shift = 1'b0;ALUsrc = 1'b1; Regwrite2 = 1'b1;MemtoReg = 1'b1; writereg3 = 5'h11; Regwrite3 = 1'b0;
       /*  #0.1 clk = ~clk;rt = 5'h11;shift=0;ALUsrc=1;Regwrite2=1;MemtoReg=0;
       #0.1 clk = ~clk;
        #0.1 clk = ~clk;writereg2 = 5'h11;rs=5'h11;rt=5'h11;Regwrite3=1;*/
    end
    always
    begin
        #0.1 clk=~clk;
    end
endmodule
