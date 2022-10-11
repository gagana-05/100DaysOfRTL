module shiftReg(clk, reset, din, load, sr_out);

input clk, reset;
input din, load;

output [3:0]sr_out;
reg [3:0] sreg;

assign sr_out = sreg;

always@(posedge clk) begin
    if(!reset)
        sreg <= 0;
    else if(load)
        sreg <= din;
    else 
        sreg <={din,sreg[3:1]};

end
endmodule

