`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 22:56:14
// Design Name: 
// Module Name: scan
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


module scan(
    input clk_display,
    input [31:0] temp_out,
    output reg [7:0] control,
    output reg [3:0] decipher_in
);
always@(posedge clk_display) 
    begin    
        case(control)
        8'b11111110:
        begin    
            decipher_in<=temp_out[7:4];
            control<=8'b11111101;
        end
        8'b11111101:
        begin
            decipher_in<=temp_out[11:8];
            control<=8'b11111011;
        end
        8'b11111011:
        begin
            decipher_in<=temp_out[15:12];
            control<=8'b11110111;
        end
        8'b11110111:
        begin
            decipher_in<=temp_out[19:16];
            control<=8'b11101111;
        end
        8'b11101111:
        begin
            decipher_in<=temp_out[23:20];
            control<=8'b11011111;
        end
        8'b11011111:
        begin
            decipher_in<=temp_out[27:24];
            control<=8'b10111111;
        end
        8'b10111111:
        begin
            decipher_in<=temp_out[31:28];
            control<=8'b01111111;
        end
        default:
        begin
            decipher_in<=temp_out[3:0];
            control<=8'b11111110;
        end
        endcase
    end    
endmodule

