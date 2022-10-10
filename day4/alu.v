//8-bit ALU
module alu#(parameter N = 8)(a, b, out, sel, clk, reset);

input [N-1:0] a, b;
input [2:0]sel;
input clk, reset;
output reg [N-1:0] out;

reg carry;
parameter ADD = 3'b000,
          SUB = 3'b001,
          LSL = 3'b010,
          LSR = 3'b011,
          AND = 3'b100,
          OR  = 3'b101,
          XOR = 3'b110,
          EQL = 3'b111;

always @(posedge clk) begin
if (reset) begin
out <= 0;
end
else begin
    case (sel)
        ADD: {carry, out} <= a + b;
        SUB: out <= a - b;
        LSL: out <= a << b;
        LSR: out <= a >> b;
        AND: out <= a & b;
        OR:  out <= a | b;
        XOR: out <= a ^ b;
        EQL: out <= a == b;
    endcase
end
end

endmodule