

module comparator_2bit(input [1:0] x,y, output reg x_gt_y,x_eq_y,x_lt_y);
    always @(*) begin
        x_gt_y=(x> y);
        x_eq_y=(x== y);
        x_lt_y=(x< y);
    end
endmodule

module comparator_4bit(input [3:0] x,y,output x_gt_y,x_eq_y,x_lt_y);
    wire msb_gt,msb_eq,msb_lt;
    wire lsb_gt,lsb_eq,lsb_lt;
    comparator_2bit msb_comp(x[3:2],y[3:2],msb_gt,msb_eq,msb_lt);
    comparator_2bit lsb_comp(x[1:0],y[1:0],lsb_gt,lsb_eq,lsb_lt);
    assign x_gt_y=msb_gt | (msb_eq & lsb_gt);
    assign x_eq_y=msb_eq & lsb_eq;
    assign x_lt_y=msb_lt | (msb_eq & lsb_lt);
endmodule

module comparator_4bit_tb;
    reg [3:0] x, y;
    wire x_gt_y, x_eq_y, x_lt_y;
    comparator_4bit comp(x,y,x_gt_y,x_eq_y,x_lt_y);

    initial begin
        $dumpfile("comparator4bit.vcd");
        $dumpvars(0, comparator_4bit_tb);
        x=4'b0000;y=4'b0000;#10;
        x=4'b1001;y=4'b0110;#10;
        x=4'b0011;y=4'b1010;#10;
        x=4'b1111;y=4'b1111;#10;
        $finish;
    end
endmodule


