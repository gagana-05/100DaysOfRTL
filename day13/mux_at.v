module MUX#(parameter N = 2)(in, out_ter, out_case, out_ifel, out_for, out_aot, sel);

input [N-1:0] in;
input sel;
output out_ter, out_aot;
output reg out_case, out_ifel, out_for;

integer i;

// Ternary operator
assign out_ter = (sel == 1'b0) ? in[0] : in[1];


// Using case statement
always @(sel) begin
    case(sel)
        1'b0: out_case = in[0];
        1'b1: out_case = in[1];
    endcase
end

// Using if-else statement
always @(sel) begin
    if(sel == 1'b0) 
        out_ifel = in[0];
    else
        out_ifel = in[1];
end

// using combitoral for loop
always @(*) begin 
    out_for = 1'b0;
    for(i = 0; i < N; i = i + 1) begin
        out_for = (sel & in[i]) | out_for;
    end
end


// using and-or tree
assign out_aot = (sel & in[0]) | (sel & in[1]);

endmodule


