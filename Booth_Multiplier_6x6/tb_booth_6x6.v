`timescale 1ns / 1ps 
 
module kushal_0263_tb; 
  reg signed [5:0] multiplicand; 
  reg signed [5:0] multiplier; 
  wire signed [11:0] product; 
 
  kushal_0263 dut ( 
    multiplicand, 
    multiplier, 
    product 
  ); 
 
  initial begin 
    multiplicand = 6;  multiplier = 2;  #10; $display("6 * 2 = %d (expected 12)", product); 
    multiplicand = -3; multiplier = 5;  #10; $display("-3 * 5 = %d (expected -15)", product); 
    multiplicand = 8;  multiplier = -4; #10; $display("8 * -4 = %d (expected -32)", product); 
    multiplicand = -7; multiplier = -6; #10; $display("-7 * -6 = %d (expected 42)", product); 
    multiplicand = 15; multiplier = 15; #10; $display("15 * 15 = %d (expected 225)", product); 
    multiplicand = -16; multiplier = -16; #10; $display("-16 * -16 = %d (expected 256)", product); 
    multiplicand = 1; multiplier = 31; #10; $display("1 * 31 = %d (expected 31)", product); 
    multiplicand = 31; multiplier = 1; #10; $display("31 * 1 = %d (expected 31)", product); 
    multiplicand = -15; multiplier = 30; #10; $display("-15 * 30 = %d (expected -450)", product); 
    multiplicand = 30; multiplier = -15; #10; $display("30 * -15 = %d (expected -450)", product); 
    $finish; 
  end 
endmodule 
