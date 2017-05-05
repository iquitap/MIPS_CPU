`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 15:11:23
// Design Name: 
// Module Name: pcc
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


module pcc(
    input jr,
    input jal,
    input j,
    input bgtz,
    input branch,
    output pcc
    );
    assign pcc = jr | jal | j | bgtz | branch;
endmodule
