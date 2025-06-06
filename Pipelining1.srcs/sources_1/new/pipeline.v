`timescale 1ns / 1ps

module pipeline (F,A,B,C,D,clk);
    parameter N=16;

    input [N-1:0]A,B,C,D;
    input clk;
    output [N-1:0]F;
    reg [N-1:0] L12_x1,L12_x2,L12_D,L23_x3,L23_D,L34_F;

    assign F=L34_F;

    always @(posedge clk)
    begin
        //STAGE1
        L12_x1<=A + B;
        L12_x2<=C - D;
        L12_D<=D;

        //STAGE 2
        L23_x3<=L12_x1 + L12_x2;
        L23_D<=L12_D;

        //STAGE3
        L34_F<=L23_x3 * L23_D;
    end
endmodule
