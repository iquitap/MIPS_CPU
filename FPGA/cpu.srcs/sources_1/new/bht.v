`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/10 16:42:54
// Design Name: 
// Module Name: bht
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


module bht(
    input clk,
    input [31:0] pc_id,
    input [31:0] pc_ex,
    input hit,
    input [31:0] branch_addr_in,
    input branch_ex,
    input j_ex,
    output [31:0]branch_addr_out,
    output valid_out
    //output [1:0]state_out
    );
    reg [31:0] bht_pc[7:0];
    reg [31:0] bht_branch_addr [7:0];
    reg [0:0] bht_valid [7:0];
    reg [1:0] bht_state [7:0];
    reg [2:0] LRU_count[7:0];
    
    integer i;
    initial
    begin
        for (i = 0 ; i <= 7; i = i + 1)
        begin
            bht_pc[i] = 32'b0;
            bht_branch_addr[i] = 32'b0;
            bht_valid[i] = 1'b0;
            bht_state[i] = 2'b00;
            LRU_count[i] = 3'b0;
        end 
    end
    
    
    wire [3:0] index_id;
    assign index_id =   (pc_id == 32'b0) ? 4'hf : 
                        (pc_id == bht_pc[0] && bht_valid[0]) ? 0 :
                        (pc_id == bht_pc[1] && bht_valid[1]) ? 1 :
                        (pc_id == bht_pc[2] && bht_valid[2]) ? 2 :
                        (pc_id == bht_pc[3] && bht_valid[3]) ? 3 :
                        (pc_id == bht_pc[4] && bht_valid[4]) ? 4 :
                        (pc_id == bht_pc[5] && bht_valid[5]) ? 5 :
                        (pc_id == bht_pc[6] && bht_valid[6]) ? 6 :
                        (pc_id == bht_pc[7] && bht_valid[7]) ? 7 :
                        4'hf;
    assign valid_out = (index_id == 4'hf) ? 0 : (( bht_state[index_id] == 0 || bht_state[index_id] == 1) ? 0 : 1);
    //assign state_out = valid_out ? bht_state[index_id]
    assign branch_addr_out = (index_id == 4'hf) ? 0 : bht_branch_addr[index_id];

    wire [3:0] index_ex;
    assign index_ex =   (pc_ex == 32'b0) ? 4'hf : 
                        (pc_ex == bht_pc[0] && bht_valid[0]) ? 0 :
                        (pc_ex == bht_pc[1] && bht_valid[1]) ? 1 :
                        (pc_ex == bht_pc[2] && bht_valid[2]) ? 2 :
                        (pc_ex == bht_pc[3] && bht_valid[3]) ? 3 :
                        (pc_ex == bht_pc[4] && bht_valid[4]) ? 4 :
                        (pc_ex == bht_pc[5] && bht_valid[5]) ? 5 :
                        (pc_ex == bht_pc[6] && bht_valid[6]) ? 6 :
                        (pc_ex == bht_pc[7] && bht_valid[7]) ? 7 :
                        4'hf;    
    
    
    wire [3:0]bht_index_choose;
    assign bht_index_choose = 
        bht_valid[0]==0 ? 0 : 
        (bht_valid[1]==0 ? 1 : 
        (bht_valid[2]==0 ? 2 : 
        (bht_valid[3]==0 ? 3 : 
        (bht_valid[4]==0 ? 4 : 
        (bht_valid[5]==0 ? 5 :
        (bht_valid[6]==0 ? 6 :
        (bht_valid[7]==0 ? 7 :
        ((LRU_count[0] >= LRU_count[1] && LRU_count[0] >= LRU_count[2]
        && LRU_count[0] >= LRU_count[3] && LRU_count[0] >= LRU_count[4]
        && LRU_count[0] >= LRU_count[5] && LRU_count[0] >= LRU_count[6]
        && LRU_count[0] >= LRU_count[7]) ? 0 :      
        ((LRU_count[1] >= LRU_count[0] && LRU_count[1] >= LRU_count[2]
        && LRU_count[1] >= LRU_count[3] && LRU_count[1] >= LRU_count[4]
        && LRU_count[1] >= LRU_count[5] && LRU_count[0] >= LRU_count[6]
        && LRU_count[1] >= LRU_count[7]) ? 1 : 
        ((LRU_count[2] >= LRU_count[0] && LRU_count[2] >= LRU_count[1]
        && LRU_count[2] >= LRU_count[3] && LRU_count[2] >= LRU_count[4]
        && LRU_count[2] >= LRU_count[5] && LRU_count[2] >= LRU_count[6]
        && LRU_count[2] >= LRU_count[7]) ? 2 : 
        ((LRU_count[3] >= LRU_count[0] && LRU_count[3] >= LRU_count[1]
        && LRU_count[3] >= LRU_count[2] && LRU_count[3] >= LRU_count[4]
        && LRU_count[3] >= LRU_count[5] && LRU_count[3] >= LRU_count[6]
        && LRU_count[3] >= LRU_count[7]) ? 3 : 
        ((LRU_count[4] >= LRU_count[0] && LRU_count[4] >= LRU_count[1]
        && LRU_count[4] >= LRU_count[2] && LRU_count[4] >= LRU_count[3]
        && LRU_count[4] >= LRU_count[5] && LRU_count[4] >= LRU_count[6]
        && LRU_count[4] >= LRU_count[7]) ? 4 : 
        ((LRU_count[5] >= LRU_count[0] && LRU_count[5] >= LRU_count[1]
        && LRU_count[5] >= LRU_count[2] && LRU_count[5] >= LRU_count[3]
        && LRU_count[5] >= LRU_count[4] && LRU_count[5] >= LRU_count[6]
        && LRU_count[5] >= LRU_count[7]) ? 5 :                       
        ((LRU_count[6] >= LRU_count[0] && LRU_count[6] >= LRU_count[1]
        && LRU_count[6] >= LRU_count[2] && LRU_count[6] >= LRU_count[3]
        && LRU_count[6] >= LRU_count[4] && LRU_count[6] >= LRU_count[5]
        && LRU_count[6] >= LRU_count[7]) ? 6 : 7       
        ))))))))))))));  
    
    
    
    
    always @(negedge clk)
    begin
        if(branch_ex && pc_ex!=32'b0)
        begin
            LRU_count[0] = (index_ex == 0) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[1] = (index_ex == 1) ? 0 : (LRU_count[1]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[2] = (index_ex == 2) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[3] = (index_ex == 3) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[4] = (index_ex == 4) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[5] = (index_ex == 5) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[6] = (index_ex == 6) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            LRU_count[7] = (index_ex == 7) ? 0 : (LRU_count[0]==7 ? 7 : LRU_count[0] + 1);
            
            if(index_ex == 4'hf && pc_ex != 32'b0)
            begin
                LRU_count[bht_index_choose] <= 0;
                //bht_state[bht_index_choose] <= (j_ex==1) ? 3 : 2;
                bht_state[bht_index_choose] <= 2;
                bht_pc[bht_index_choose] <= pc_ex;
                bht_branch_addr[bht_index_choose] <= branch_addr_in;
                bht_valid[bht_index_choose] <= 1;
            end
            else if(hit)
            begin
                bht_state[index_ex] = ( bht_state[index_ex]==3 ) ? 3 : bht_state[index_ex] + 1;
            end
            else // not hit
                bht_state[index_ex] = ( bht_state[index_ex]==0 ) ? 0 : bht_state[index_ex] - 1;
        end
    
    end
endmodule
