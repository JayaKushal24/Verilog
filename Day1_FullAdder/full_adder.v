//Half adder using data flow modeling
module half_adder (input a,b,output sum,carry);
assign sum = a^b;
assign carry = a&b;
endmodule

//Full adder using half adder
module full_adder(input a,b,cin,output sum,carry);
wire c,c1,s;
half_adder ha0(a,b,s,c);
half_adder ha1(cin,s,sum,c1);
assign carry = c|c1 ;
endmodule

//testbench
module full_adder_tb;
reg a,b,cin;
wire sum,carry;
full_adder fa1(a,b,cin,sum,carry);
initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_tb);
a=0; b=0; cin=0;
#10 a=0; b=0; cin=1;
#10 a=0; b=1; cin=0;
#10 a=0; b=1; cin=1;
#10 a=1; b=0; cin=0;
#10 a=1; b=0; cin=1;
#10 a=1; b=1; cin=0;
#10 a=1; b=1; cin=1;
#10 $finish;
end             
endmodule