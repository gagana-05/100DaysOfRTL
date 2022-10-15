module pToSReg#(parameter N = 4)(clk, reset, empty_o, parallel_i, serial_o, valid_o);

input clk, reset;
output empty_o;
input [N-1:0] parallel_i;

output serial_o, valid_o;

reg [N-1:0] shift_ff, nxt_shift_ff;
reg [N-1:0] count_ff, nxt_count_ff;

always @(posedge clk) begin
    if(reset)
        shift_ff <= 0;
    else 
        shift_ff <= nxt_shift_ff;
    end

    assign nxt_shift_ff = empty_o ? parallel_i : {1'b0,shift_ff[3:1]};

    assign serial_o = shift_ff[0];

    // maintain a counter to drive valid and empty
    always @(posedge clk) begin
        if(reset)
            count_ff <= 0;
        else
            count_ff <= nxt_count_ff;
    end

    assign nxt_count_ff = (count_ff == 3'h4) ? 3'h0 : count_ff + 1;

    // valid when counter greater than zero
    assign valid_o = (count_ff > 0);

    //empty when counter is zero
    assign empty_o = (count_ff == 0);
    
endmodule


