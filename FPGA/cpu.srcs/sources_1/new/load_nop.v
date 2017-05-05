`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 15:13:42
// Design Name: 
// Module Name: load_nop
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


module load_nop(
    input [4:0]writereg2,
    input [4:0]rs,
    input [4:0]rt,
    input shift,
    input ALUsrc,
    input Regwrite2,
    input MemtoReg,
    input [4:0]writereg3,
    input Regwrite3,
    input clk,
    output load_nop,
    output reg from1r1,
    output reg from1y,
    output reg from1r2,
    output reg from2r1,
    output reg from2y,
    output reg from2r2
    /*output temp1,
    output temp2,
    output temp3,
    output temp4,
    output temp5,
    output temp6,
    output temp7,
    output temp8,
    output temp9,
    output temp10,
    output temp11,
    output temp12,
    output temp13,
    output temp14,
    output temp_from1r1,
    output temp_from1y,
    output temp_from1r2,
    output temp_from2r1,
    output temp_from2y,
    output temp_from2r2,
    output reg temp_from1r1_reg,
    output reg temp_from1y_reg,
    output reg temp_from1r2_reg,
    output reg temp_from2r1_reg,
    output reg temp_from2y_reg,
    output reg temp_from2r2_reg*/
    );
    wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13,temp14;
    //reg temp_from1r1_reg,temp_from1y_reg,temp_from1r2_reg,temp_from2r1_reg,temp_from2y_reg,temp_from2r2_reg;
    wire temp_from1r1,temp_from1y,temp_from1r2,temp_from2r1,temp_from2y,temp_from2r2;
    reg temp_from1r1_reg,temp_from1y_reg,temp_from2r1_reg,temp_from2y_reg,temp_from2r2_reg;
        
    assign temp1 = (writereg2==5'b0) ? 1'b1 : 1'b0;
    assign temp2 = (rs==5'b0) ? 1'b1 : 1'b0;
    assign temp3 = (rt==5'b0) ? 1'b1 : 1'b0; 
    assign temp4 = (writereg2 == (~shift ? rs : 5'b0)) ? 1'b1 : 1'b0;
    assign temp5 = (writereg2 == ((shift | ~ALUsrc) ? rt : 5'b0)) ? 1'b1 : 1'b0;
    assign temp6 = (writereg2 == rt) ? 1'b1 : 1'b0;
    assign temp7 = ~temp1 & ~temp2 & temp4;
    assign temp8 = ~temp1 & temp5 & ~temp3;
    
    assign temp_from1r2 = (~temp1 & ~temp3 & temp6 & ALUsrc);   
    //assign from1r2 = ~temp1 | ~temp3 | temp6 | ALUsrc;
    
    assign load_nop = ( (temp7 & MemtoReg)  | ( MemtoReg & temp8)) & Regwrite2;
    
    //assign from1r1 = (temp7 & ~MemtoReg & Regwrite2) | ( shift & ( ~MemtoReg & temp8 & Regwrite2));
    //assign from1y = ~(shift & ( ~MemtoReg & temp8 & Regwrite2)) & ( ~MemtoReg & temp8 & Regwrite2);
    assign temp_from1r1 = (~(~((temp7 & ~MemtoReg & Regwrite2) | ( shift & ( ~MemtoReg & temp8 & Regwrite2)))));  
    assign temp_from1y = ((( ~MemtoReg & temp8 & Regwrite2)) & ~shift);
    
    assign temp9 = (writereg3==5'b0) ? 1'b0 : 1'b1;
    assign temp10 = (rs == 5'b0) ? 1'b0 : 1'b1;
    assign temp11 = (rt == 5'b0) ? 1'b0: 1'b1;
    assign temp12 = (writereg3 == (~shift ? rs : 5'h0)) ? 1'b1: 1'b0;
    assign temp13 = (writereg3 == ((shift | ~ALUsrc) ? rt : 5'h0)) ? 1'b1: 1'b0;
    assign temp14 = (writereg3 == rt) ? 1'b1: 1'b0; 
    
    assign temp_from2r1 = ((temp9&temp10&temp12) & Regwrite3); 
    assign temp_from2y = (( temp9 & temp13 & temp11)& Regwrite3);
    assign temp_from2r2 = (temp9 & temp11 & temp14 & ALUsrc);
    
    initial 
    begin
        temp_from1r1_reg <= 1'b0;
        //temp_from1r2_reg <= 1'b0; 
        temp_from1y_reg <= 1'b0;
        temp_from2r1_reg <= 1'b0;
        temp_from2y_reg <= 1'b0;
        temp_from2r2_reg <= 1'b0;  
        from1r1 <= 1'b0;
        from1r2 <= 1'b0; 
        from1y <= 1'b0;
        from2r1 <= 1'b0;
        from2y <= 1'b0;
        from2r2 <= 1'b0;   
    end
    
    always @(posedge clk)
    begin
        from1r1 <= temp_from1r1_reg;  
        from1y <= temp_from1y_reg;
        //from1r2 <= temp_from1r2_reg;
        from2r1 <= temp_from2r1_reg;
        from2y <= temp_from2y_reg;
        from2r2 <= temp_from2r2_reg;
        
        from1r2 <= temp_from1r2;
    end
    
    always @(negedge clk)
    begin
        temp_from1r1_reg <= temp_from1r1;     
        temp_from1y_reg <= temp_from1y;
        //temp_from1r2_reg <= temp_from1r2;
        temp_from2r1_reg <= temp_from2r1;
        temp_from2y_reg <= temp_from2y;
        temp_from2r2_reg <= temp_from2r2; 
    end
endmodule
