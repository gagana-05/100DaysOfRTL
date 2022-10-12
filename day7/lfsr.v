module lfsr #(parameter N=4)(clk, reset, lfsr_out);

input clk, reset;
output [N-1:0]lfsr_out;

reg [N-1:0] f_reg ; // feedback reg

assign lfsr_out = f_reg;
always @(posedge clk)begin
    if(!reset)
        f_reg <= 4'he;
    else
        f_reg <= {f_reg[2:0], f_reg[3] ^ f_reg[1]};
    
end
endmodule

