module countLoad#(parameter N=4)(clk, reset, load, load_val, out);

input clk, reset, load;
input [N-1:0] load_val;
output [N-1:0] out;

reg [N-1:0]count_reg;
reg [N-1:0] load_reg, nxt_count;

always @(posedge clk or posedge reset)begin
    if(reset) 
    load_reg <= 0;
    else if(load)
    load_reg <= load_val;
end


always @(posedge clk or posedge reset)begin
    if(reset) 
    count_reg <= 0;
    else
    count_reg <= nxt_count;
end

assign nxt_count = load ? load_val : (count_reg == 4'hf) ? load_reg : count_reg + 1;
assign out = count_reg;
endmodule




