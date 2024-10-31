
module nbitcounter(input clk,rst,output reg [N-1:0] count);
    parameter N = 8;
    always @(negedge clk) 
    begin
        if (rst)
            count <= 0;
        else
            count <= count + 1;
    end
endmodule

module nbitcounter_tb;
    reg clk;
    reg rst;
    wire [7:0] count; 
    nbitcounter #(.N(8)) mycounter (.clk(clk),.rst(rst),.count(count));
    //here #(.N(8)) specifies that the parameter N of the nbitcounter module should be set to 8
    //The # indicates that you're passing parameters to the module
    //mycounter is instance name...can be anything

    initial begin
        $dumpfile("nbitcounter.vcd");
        $dumpvars(0, nbitcounter_tb);
        clk = 0;
        rst = 1; #10; 
        rst = 0;
        forever #5 clk = ~clk; // Toggle
    end
    initial begin
        #100; 
        $finish;
    end
endmodule


