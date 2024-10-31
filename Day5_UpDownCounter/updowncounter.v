
module upordown_counter(input Clk,reset,UpOrDown,output reg [3:0] Count);
    always @(posedge Clk or posedge reset) begin
        if (reset) 
            Count<=0;
        else if (UpOrDown) begin
            if (Count==15)
                Count<=0;
            else
                Count<=Count+1;
        end else begin
            if (Count==0)
                Count<=15;
            else
                Count<=Count - 1;
        end
    end    
endmodule

module upordown_counter_tb;
    reg Clk,reset,UpOrDown;
    wire [3:0] Count;
    upordown_counter counter(Clk,reset,UpOrDown,Count);

    initial begin
        $dumpfile("upordown_counter.vcd");
        $dumpvars(0,upordown_counter_tb);
        Clk= 0;reset =1;UpOrDown = 1; #10;
        reset=0; #10;
        UpOrDown = 1; // Count Up
        repeat (20) begin
            #5 Clk = ~Clk; // Toggle
        end
        UpOrDown = 0; // count DOwn
        repeat (20) begin
            #5 Clk = ~Clk; // Toggle
        end
        $finish;
    end
endmodule


