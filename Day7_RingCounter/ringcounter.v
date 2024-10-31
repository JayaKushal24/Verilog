
module ringcounter(input clk,init,output reg [7:0] count);
    always @(posedge clk) begin
        if (init) 
            count <= 8'b10000000;
        else begin
            count <= {count[6:0], count[7]}; 
        end
    end
endmodule

module ringcounter_tb;
    reg clk;
    reg init;
    wire [7:0] count;
    ringcounter DUT(clk,init,count);
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("ringcounter.vcd");
        $dumpvars(0, ringcounter_tb);
        
        init = 1; 
        #10; 
        init = 0;
        #100;
        $finish;
    end
endmodule
