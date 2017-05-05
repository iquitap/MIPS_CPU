`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 14:41:45
// Design Name: 
// Module Name: ram
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


module ram(
    input [31:0]addr,
    input [31:0]data_in,
    input sb3,MemWrite3,MemRead3,clk,
    output [31:0]reddate,
    output [31:0]data_out
    //output sel0,sel1,sel2,sel3,
    //output [7:0] data0_out,data1_out,data2_out,data3_out,
    //output [23:0] memaddr
    );
    wire sel0,sel1,sel2,sel3;
    reg [7:0] mem0 [2**10-1:0]; 
    reg [7:0] mem1 [2**10-1:0];
    reg [7:0] mem2 [2**10-1:0];
    reg [7:0] mem3 [2**10-1:0];
    wire [7:0] data0_in,data1_in,data2_in,data3_in;
    wire [7:0] data0_out,data1_out,data2_out,data3_out;
    wire [23:0]memaddr;
    assign memaddr = addr[25:2];
    assign sel0 = ((~addr[0:0])&(~addr[1:1]))|(~sb3);
    assign sel1 = ((~addr[0:0])&(addr[1:1]))|(~sb3);
    assign sel2 = ((addr[0:0])&(~addr[1:1]))|(~sb3);
    assign sel3 = ((addr[0:0])&(addr[1:1]))|(~sb3);
    assign data0_in = data_in[7:0];
    assign data1_in = sb3?(data_in[7:0]):(data_in[15:8]);
    assign data2_in = sb3?(data_in[7:0]):(data_in[23:16]);
    assign data3_in = sb3?(data_in[7:0]):(data_in[31:24]);
    assign data0_out = sel0?(MemRead3?mem0[memaddr]:8'bz):8'bz;
    assign data1_out = sel1?(MemRead3?mem1[memaddr]:8'bz):8'bz;
    assign data2_out = sel2?(MemRead3?mem2[memaddr]:8'bz):8'bz;
    assign data3_out = sel3?(MemRead3?mem3[memaddr]:8'bz):8'bz;
    assign data_out = {data3_out,data2_out,data1_out,data0_out};
    assign reddate = MemRead3?data_out:addr;
    
    integer i;
    initial 
    begin 
        for(i=0;i<2**10-1;i=i+1)
        begin
            mem0[i] = 8'b0;
            mem1[i] = 8'b0;
            mem2[i] = 8'b0;
            mem3[i] = 8'b0;
        end
    end
    always@(posedge clk)
    begin
        if(MemWrite3)
        begin
            if(sel0)
                mem0[memaddr]<=data0_in;
            if(sel1)
                mem1[memaddr]<=data1_in;    
            if(sel2)
                mem2[memaddr]<=data2_in; 
            if(sel3)
                mem3[memaddr]<=data3_in;                  
        end
    end
endmodule
