//overlapping sequence to be detected
module seqDet(clk, reset, ser_in, det_out);

input clk, reset;
input ser_in;
output det_out;

reg [11:0] shift_ff, nxt_shift_ff;

always @(posedge clk or posedge reset)begin
    if(reset) 
    shift_ff <= 0;
    else
    shift_ff <= nxt_shift_ff;
end

//input is fed from left
assign nxt_shift_ff = {ser_in, shift_ff[11:1]};

assign det_out = (shift_ff == 12'b1110_1101_1011) ? 1 : 0;

endmodule


