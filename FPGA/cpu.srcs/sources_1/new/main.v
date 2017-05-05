`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 15:25:06
// Design Name: 
// Module Name: main
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


module main(
    input clkk,
    input IR0,
    input IR1,
    input IR2,
    output [31:0] count,
    output [31:0] a0,
    output [1:0] iterNo
   /* output IR0_LED,
    output IR1_LED, 
    output IR2_LED*/
    );
    
    
    wire halt,load_nop,pcc;
    wire [31:0]pc_in ,pc_0,ins_0, pc_40, ins, im0 ,im2 , im3, PC ,PC2 ,PC3 , PC4 , ins2 , ins3 , extend_im2;
    
    wire [31:0] singal ,singal2, singal3;
    wire Zero_extend, RegDst, shift,J,jal,Jr,beq,bne,MemRead,MemtoReg,MemWrite,Regwrite,ALUsrc,sys,srav,lui,sb,bgtz, eret, mfc0, mtc0;
    wire RegDst2, shift2,J2,jal2,Jr2,beq2,bne2,MemRead2,MemtoReg2,MemWrite2,Regwrite2,ALUsrc2,sys2,srav2,lui2,sb2,bgtz2;
    wire J3,jal3,Jr3,beq3,bne3,MemRead3,MemtoReg3,MemWrite3,Regwrite3,sys3,srav3,lui3,sb3,bgtz3;
    wire jal4,MemtoReg4,Regwrite4,sys4,lui4;
    wire [4:0] writereg1, writereg2, writereg3,writereg4;
    wire [3:0] ALUop,ALUop2;
    wire [31:0] writeback0,writeback,writeback_wb,reddate;
    
    wire [5:0] op;
    wire [4:0] rs, rt, rd, rs0, rd0;
    wire [4:0] rd2 , rs2 , rt2;
    wire [15:0] im;
     
    wire [31:0] s0,s1,s2,R1,R2,R12 ,R13,R22;
    wire [27:0] ins_shift2;
    
    wire equal,branch;
    wire [31:0] X,Y,XX,YY,result0,result,result_r2,memdate,memdate0,mem_data_out;
    wire from1r1,from2r1,from1r2,from2r2,from1y,from2y;
    
    wire clk;
    
    wire END,INS,ERET; //@
    //wire [1:0] iterNo;
    wire [31:0] mux1_IF_out,mux2_IF_out,mux3_IF_out;
    wire [31:0] epc_out;
    wire ie_out,INT_1,INT_2;
    wire mfc0_wb,mfc0_ex,mfc0_mem;
    
    wire hit;
    wire valid_out;
    wire [31:0] branch_addr_out;
    reg [31:0]branch_addr_out1,branch_addr_out2;
    reg valid_out2,valid_out1;
    wire bht_fail;
    wire state_out;
    reg [31:0]count_bht_fail,count_branch,count_hit;
    assign clk = ~halt&clkk;
    count count_(clk, halt,count);
    always @(posedge bht_fail)
    begin
        count_bht_fail <= count_bht_fail + 1;
    end
    always @(posedge hit)
    begin
        count_hit <= count_hit + 1;
    end
    always @(posedge branch)
    begin
        count_branch <= count_branch + 1;
    end
    initial
    begin
        branch_addr_out1 <= 0;
        branch_addr_out2 <= 0;
        valid_out1 <= 0;
        valid_out2 <= 0;
        count_bht_fail <= 0;
        count_branch <= 0;
        count_hit <= 0;
        //bht_fail <= 0;
    end
    
    //IF
    halt halt_(s0 , sys4 , clk , halt);
    mux2_1 mux1_IF(pc_in , 32'b0 , INT_2 , mux1_IF_out),
           mux2_IF(mux1_IF_out,epc_out,ERET,mux2_IF_out),
           mux3_IF(mux2_IF_out,branch_addr_out,valid_out,mux3_IF_out);
    //assign mux3_IF_out = (valid_out==2||valid_out==3) ? branch_addr_out : mux2_IF_out;
    //assign mux2_IF_out = mux_IF_out;
    //pc pc_(clk&(~halt) , 1'b0, ~load_nop & ~(halt|INT_1|END), mux3_IF_out, pc_0);     //如果有了中断，clear端要设为INS2,enable也要改
    pc pc_(clk&(~halt) , 1'b0, ~(halt|INT_1|END), mux3_IF_out, pc_0);
    //instruction instruction_(pc_0[11:2], 1'b1, 2'b0, ins_0);         //同上
    instruction instruction_(pc_0[11:2],~(halt|bht_fail|INT_1|INT_2|END|J2|jal2|Jr2), iterNo, ins_0);
    
    assign pc_40 = pc_0 + 32'd4;
    //IF_ID IF_ID_(clk, load_nop|INT_1|INT_2|END, load_nop|pcc, pc_40, ins_0, PC, ins);    
    IF_ID IF_ID_(clk, INT_1|INT_2|END, bht_fail|J2|jal2|Jr2, pc_40, ins_0, PC, ins);    
    
    //ID
    control control_(ins[31:26], ins[5:0], Zero_extend, RegDst, shift,J,jal,Jr,beq,bne,MemRead,MemtoReg,MemWrite,Regwrite,ALUsrc,ALUop,sys,srav,lui,sb,bgtz);
    
    assign  op = ins[31:26] ,
            rs = ins[25:21] ,
            rt = ins[20:16] ,
            im = ins[15:0] ;
    assign  rs0 = sys ?  5'h02 : ( Jr ? 5'h1f : ( shift ? rt :rs) ),
            rd = ins[15:11],
            rd0 = jal ? 5'h1f : ( RegDst ? rd : rt) ,
            writereg1 = rd0;
            
    mux2_1 mux0(({{16{im[15]}}, im}) , ({16'h0, im}) , Zero_extend , im0);
    regfile regfile_(rs0, rt, writereg4, Regwrite4 | mfc0_wb , clk,  writeback, s0, s1, s2, a0, R1, R2); //clk下降沿写回
    singal singal_( Zero_extend, RegDst, shift, J, jal, Jr, beq, bne,  MemRead, MemtoReg,  MemWrite, Regwrite, ALUsrc, ALUop, sys, srav, lui, sb, bgtz, singal);
    
    
    ID_EX ID_EX_(clk, 1'b0, bht_fail|J2|jal2|Jr2, ins[27:0]<<2 , PC, ins, singal, R1, R2, rd0, im0, { 27'b0,im[10:6]} , ins_shift2, PC2, ins2, singal2, R12, R22, writereg2, im2, extend_im2);
    
    //EX
    singal2 singal2_( singal2, RegDst2, shift2, J2, jal2, Jr2, beq2, bne2, MemRead2, MemtoReg2,  MemWrite2, Regwrite2, ALUsrc2, ALUop2, sys2, srav2, lui2, sb2, bgtz2);   
    assign rd2 = jal2 ? 5'h1f : (RegDst ? ins2[15:11] : ins2[20:16]);
    assign rs2 = sys2 ? 5'h2 : (Jr2 ? 5'h1f : (shift2 ? ins2[20:16] : (srav2 ? ins[20:16] : ins[25:21])));
    assign rt2 = srav2 ? ins[25:21] : ins[20:16];
    cacl_pc cacl_pc_(equal, bne2, beq2, ins_shift2 , PC2, J2 , jal2 , bgtz2 , Jr2 , R12 , im2 , X , pc_40, pcc ,branch ,pc_in);
    pcc pcc_(Jr2, jal2 ,J2 , bgtz2 , branch , pcc);
    assign XX = from2r1 ? writeback : (from1r1 ? reddate : R12);
    assign YY = from1y ? reddate : ( from2y ? writeback : (sys2 ? 32'ha : (shift2 ? extend_im2 : (ALUsrc2 ? im2 : R22))));
    assign X = srav2 ? YY : XX;
    assign Y = srav2 ? XX : YY;
    assign memdate0 = from1r2 ? reddate : (from2r2 ? writeback : R22);
    alu alu_(X, Y , ALUop2 , result0 , result_r2 ,equal);
    
    
    EX_MEM EX_MEM_(clk, 1'b0, 1'b0, singal2, ins2,PC2,R12, result0,writereg2,im2, memdate0, mfc0_ex ,singal3, ins3, PC3, R13, result, writereg3 , im3 ,memdate ,mfc0_mem);

    //MEM 
    singal3 singal3_( singal3, J3, jal3, Jr3, beq3, bne3, MemRead3, MemtoReg3 ,  MemWrite3 , Regwrite3 , sys3 , srav3 , lui3 , sb3 , bgtz3 );
    load_nop load_nop_(writereg2 , rs0 ,rt ,shift ,ALUsrc , Regwrite2, MemtoReg2 , writereg3 , Regwrite3, clk, load_nop , from1r1, from1y ,from1r2 ,from2r1 ,from2y ,from2r2);
   
    ram ram_(result , memdate , sb3 , MemWrite3 , MemRead3 , clk , reddate , mem_data_out);
    assign writeback0 = jal3 ? PC3 : ( lui3 ? (im3 << 16) : (MemtoReg3 ? mem_data_out : result));
    MEM_WB MEM_WB_(clk, 1'b0 , 1'b0 , PC3, writereg3, writeback0 ,jal3 ,lui3 , MemtoReg3 , sys3 , Regwrite3 , mfc0_mem, PC4, writereg4 , writeback_wb , jal4, lui4, MemtoReg4 , sys4, Regwrite4, mfc0_wb);
    assign writeback = (mfc0_wb==1'b0) ? writeback_wb : epc_out;
    
    //INT
    control_int control_int_( ins[31:26], ins[25:21], ERET, mfc0_ex, mtc0);
    register #(1) reg1_INT(clk,0,1,ERET,END);
    interupt interupt_ (clk,IR0,IR1,IR2,ERET,~ie_out,INT_1,INT_2,iterNo);
    epc epc_ (clk , pc_0 , YY ,mtc0, ins[15:11],INT_1,epc_out);
    ie  ie_ (clk , 1'b1 , mtc0, ins[15:11],INT_1,ie_out);  
    
    
    assign hit = ((valid_out2==1 ) && (branch_addr_out2 == pc_in)) ? 1 : 0;
    assign bht_fail = (valid_out2==0 && branch && ~hit);// || (~pcc && (valid_out2==1));
    bht bht_(clk, pc_0 , PC2-4 , hit , pc_in  , branch , J2|jal2|Jr2 , branch_addr_out , valid_out);
    always@ (posedge clk)
    begin
        branch_addr_out1 <= branch_addr_out;
        branch_addr_out2 <= branch_addr_out;
        valid_out1 <= valid_out;
        valid_out2 <= valid_out1;
    end
endmodule