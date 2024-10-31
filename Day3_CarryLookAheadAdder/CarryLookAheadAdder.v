

module carry_lookahead_adder(input [3:0] a, b, input cin, output [3:0] sum, output cout);
    wire [3:0] p,g,c;
    assign g=a & b;
    assign p=a ^ b;
    assign c[0]=cin;
    assign c[1] = g[0]|(p[0] & cin);
    assign c[2] = g[1]|(p[1]& g[0])| (p[1] & p[0] &cin);
    assign c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1] &g[0])|(p[2] & p[1] &p[0]&cin);
    assign cout=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
    assign sum = p ^ c;
endmodule

module carry_lookahead_adder_tb;
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout;
    carry_lookahead_adder cla(a,b,cin,sum,cout);

    initial begin
        $dumpfile("carry_lookahead_adder.vcd");
        $dumpvars(0, carry_lookahead_adder_tb);
        a=4'b0000;b=4'b0000;cin=0;
        #10 a=4'b0101;b=4'b0011;cin=0;
        #10 a=4'b1100;b=4'b1010;cin=0;
        #10 a=4'b1111;b=4'b1111;cin=0;
        #10 a=4'b1001;b=4'b0110;cin=1;
        #10 $finish;
    end
endmodule
