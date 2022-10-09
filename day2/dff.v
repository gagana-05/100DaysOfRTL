// all types of d flip flop
module Dff(clk, d, q_norst, q_syncrst, q_asyncrst, reset);

input clk, d, reset;
output reg q_asyncrst, q_syncrst, q_norst;

always @(posedge clk) 
    q_norst <= d;

always @(posedge clk)
    if(reset)
        q_syncrst <= 1'b0;
    else
        q_syncrst <= d;

always @(posedge clk or negedge reset)
    if (reset)
        q_asyncrst <= 0;
    else
        q_asyncrst <= d;

endmodule