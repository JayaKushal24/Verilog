module fa( input a,b,c , output s,cout);
assign s=a^b^c;
assign cout =(a&b | b&c | c&a) ;
endmodule

module signed_mul_4x4(input [3:0]x, input [3:0]y,output [7:0]z);
wire p00,p01,p02,p03,p10,p11,p12,p13,p20,p21,p22,p23,p30,p31,p32,p33,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13;
wire s2,s3,s4,s6,s7,s8;
// multiplying on the and & nand gate results ;
assign p00=x[0]&y[0];
assign p01=x[0]&y[1];
assign p02=x[0]&y[2];
assign p03=~(x[0]&y[3]);
assign p10=x[1]&y[0];
assign p11=x[1]&y[1];
assign p12=x[1]&y[2];
assign p13=~(x[1]&y[3]);
assign p20=x[2]&y[0];
assign p21=x[2]&y[1];
assign p22=x[2]&y[2];
assign p23=~(x[2]&y[3]);
assign p30=~(x[3]&y[0]);
assign p31=~(x[3]&y[1]);
assign p32=~(x[3]&y[2]);
assign p33=x[3]&y[3];
//fulladders
assign z[0]=p00;
fa fa1(p01,p10,0,z[1],c1);
fa fa2(p11,p20,c1,s2,c2);
fa fa3(p21,p30,c2,s3,c3);
fa fa4(p31,1,c3,s4,c4);
fa fa5(p02,s2,0,z[2],c5);
fa fa6(p12,s3,c5,s6,c6);
fa fa7(p22,s4,c6,s7,c7);
fa fa8(p32,c4,c7,s8,c8);
fa fa9(p03,s6,0,z[3],c9);
fa fa10(p13,s7,c9,z[4],c10);
fa fa11(p23,s8,c10,z[5],c11);
fa fa12(p33,c8,c11,z[6],c12);
fa fa13(0,1,c12,z[7],c13);
endmodule



`timescale 1ns / 1ps
module tb_sign_multiplier;
 reg [3:0]x,y;
 wire [7:0]z;
signed_mul_4x4 dut(
  .x(x),
  .y(y),
  .z(z)
);
 initial begin
 $dumpfile("output_waveform.vcd");
 $dumpvars(0,tb_sign_multiplier);
 x=4'b1110;
 y=4'b0110; 
 #20;

 #10 $finish; 
 end
endmodule 
