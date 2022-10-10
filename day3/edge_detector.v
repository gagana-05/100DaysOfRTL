module edgeDetect(a_in, clk, reset, pos_edge_o, neg_edge_o);

input a_in;
input clk, reset;
output reg pos_edge_o, neg_edge_o;

reg a_prev_in;

always @(posedge clk or negedge reset)begin
    if(!reset) 
        a_prev_in <= 0;
    else
        a_prev_in <= a_in;

    pos_edge_o = a_in & ~a_prev_in;
    neg_edge_o = ~a_in & a_prev_in;
end
endmodule
