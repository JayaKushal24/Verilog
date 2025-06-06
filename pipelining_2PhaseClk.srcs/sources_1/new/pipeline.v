module pipeline(Zout, rs1, rs2, rd, func, addr, clk1, clk2);

input  [3:0] rs1, rs2, rd, func;
input  [7:0] addr;
input        clk1, clk2;
output [15:0] Zout;

reg [15:0] L12_A, L12_B, L23_Z, L34_Z;
reg [3:0]  L12_rd, L12_func, L23_rd;
reg [7:0]  L12_addr, L23_addr, L34_addr;

reg [15:0] regbank [0:15];   // Register bank
reg [15:0] mem [0:255];      // 256 x 16 memory

assign Zout = L34_Z;

// Stage 1: Read operands and control signals
always @ (posedge clk1) begin
  L12_A    <= #2 regbank[rs1];
  L12_B    <= #2 regbank[rs2];
  L12_rd   <= #2 rd;
  L12_func <= #2 func;
  L12_addr <= #2 addr;
end

// Stage 2: ALU operation
always @ (negedge clk2) begin
  case (L12_func)
    4'd0:  L23_Z <= #2 L12_A + L12_B;
    4'd1:  L23_Z <= #2 L12_A - L12_B;
    4'd2:  L23_Z <= #2 L12_A * L12_B;
    4'd3:  L23_Z <= #2 L12_A;
    4'd4:  L23_Z <= #2 L12_B;
    4'd5:  L23_Z <= #2 L12_A & L12_B;
    4'd6:  L23_Z <= #2 L12_A | L12_B;
    4'd7:  L23_Z <= #2 L12_A ^ L12_B;
    4'd8:  L23_Z <= #2 -L12_A;
    4'd9:  L23_Z <= #2 -L12_B;
    4'd10: L23_Z <= #2 L12_A >> 1;
    4'd11: L23_Z <= #2 L12_A << 1;
    default: L23_Z <= #2 16'hxxxx;
  endcase

  L23_rd   <= #2 L12_rd;
  L23_addr <= #2 L12_addr;
end

// Stage 3: Write back to register file
always @ (posedge clk1) begin
  regbank[L23_rd] <= #2 L23_Z;
  L34_Z           <= #2 L23_Z;
  L34_addr        <= #2 L23_addr;
end

// Stage 4: Write to memory
always @ (negedge clk2) begin
  mem[L34_addr] <= #2 L34_Z;
end

endmodule
