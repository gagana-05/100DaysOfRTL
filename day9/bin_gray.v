module binToGray#(parameter N = 4)(in, out);

input [N-1:0] in;
output [N-1:0] out;

assign out = in ^ (in >> 1);

endmodule


