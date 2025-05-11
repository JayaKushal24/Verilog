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