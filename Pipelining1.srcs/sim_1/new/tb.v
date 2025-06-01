`timescale 1ns/1ps

module tb;

    parameter N=16;

    reg [N-1:0]A,B,C,D;
    reg clk;
    wire [N-1:0]F;

    pipeline #(N) dut (F,A,B,C,D,clk);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        A = 0; B = 0; C = 0; D = 0;
        #10;
        A = 10; B = 5; C = 20; D = 4;
        #10;
        A = 7; B = 3; C = 12; D = 2;
        #10;
        A = 25; B = 5; C = 30; D = 10;
        #10;
        A = 1; B = 2; C = 3; D = 1;
        #10;
        A = 100; B = 200; C = 300; D = 50;
        #50;
        $finish;
    end
    initial begin
        $display("Time\tA\t\tB\t\tC\t\tD\t\tF");
        $monitor("%0t\t%d\t%d\t%d\t%d\t%d", $time, A, B, C, D, F);
    end

endmodule
