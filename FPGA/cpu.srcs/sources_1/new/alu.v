`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 13:13:35
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] X,
    input [31:0] Y,
    input [3:0] ALUop,
    output reg [31:0] Result,
    output reg [31:0] Result2,
    output reg Equal
    );
     always @(X, Y, ALUop)
       begin
           Result2 = 32'b0;
           if(X == Y)
                   Equal = 1;
               else
                   Equal = 0;
           case(ALUop)
               0:
                   begin
                      Result = X<<(Y[4:0]);
                   end
               1:
                   begin
                       Result = $signed(X)>>>(Y[4:0]);
                   end
               2:
                   begin
                       Result = X>>(Y[4:0]);
                   end 
               3:
                   begin
                       {Result2,Result} = X*Y;
                   end
               4:
                   begin
                       Result = X/Y;
                       Result2 = X%Y;
                   end
               5:
                   begin
                       Result = X+Y;
                   end
               6:
                   begin
                       Result = X-Y;
                   end
               7:
                   begin
                       Result = X&Y;
                       Result2 = 0;
                   end
               8:
                   begin
                       Result = X|Y;
                   end
               9:
                   begin
                       Result = X^Y;
                   end
               10:
                   begin
                       Result = ~(X|Y);
                   end
               11:
                   begin
                       case({X[31], Y[31]})
                          2'b00:
                              Result = (X<Y)?1:0;
                          2'b01:
                              Result = 0;
                          2'b10:
                              Result = 1;
                          2'b11:
                              Result = (X<Y)?0:1;
                       endcase 
                   end
               12:
                   begin
                       if(X<Y)
                           Result = 1;
                       else
                           Result = 0;
                   end
               default:
                   begin
                        Result = 0;
                   end
             endcase
       end
endmodule


