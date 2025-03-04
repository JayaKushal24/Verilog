// Half Adder Module
module half_adder(input a,b,output sum,carry);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// Full Adder Module using two Half Adders
module full_adder(input a,b,cin,output sum,carry);
    wire s,c1,c2;
    half_adder ha0(a,b,s,c1);
    half_adder ha1(cin,s,sum,c2);
    assign carry = c1 | c2;
endmodule

// 4-bit Ripple Carry Adder
module ripple_carry_adder(input [3:0] a,b,input cin,output [3:0] sum,output carry);
    wire c1,c2,c3;
    full_adder fa0(a[0],b[0],cin,sum[0],c1);
    full_adder fa1(a[1],b[1],c1,sum[1],c2);
    full_adder fa2(a[2],b[2],c2,sum[2],c3);
    full_adder fa3(a[3],b[3],c3,sum[3],carry);
endmodule

// Testbench for Ripple Carry Adder
module ripple_carry_adder_tb;
    reg [3:0] a,b;
    reg cin;
    wire [3:0] sum;
    wire carry;
    ripple_carry_adder rca(a,b,cin,sum,carry);

    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0,ripple_carry_adder_tb);
        a=4'b0000; b=4'b0000; cin=0;
        #10 a=4'b1100;b=4'b1010;cin=0;//12+10
        #10 a=4'b0101;b=4'b0011;cin=0;//5+3
        #10 a=4'b1111;b=4'b1111;cin=0;//15+15
        #10 a=4'b1001;b=4'b0110;cin=1;//9+6 + carry-in 1
        #10 $finish;
    end
endmodule
