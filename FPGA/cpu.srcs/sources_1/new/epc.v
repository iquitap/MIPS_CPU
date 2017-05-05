`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/09 21:04:39
// Design Name: 
// Module Name: epc
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


module epc(
    input clk,
    input [31:0]PC_in,
    input [31:0]d_in,
    input MTC0,
    input [4:0]r_n,
    input INT1,
    output reg [31:0]EPC_out
    );
    initial 
    begin  
        EPC_out <= 32'b0;
    end
    always@(posedge clk)
    begin
        if(INT1)
            EPC_out <= PC_in;
        else if(MTC0 && r_n==0)
            EPC_out <= d_in;
    end
endmodule
