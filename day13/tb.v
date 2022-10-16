// Path: mux_at_tb.v
module mux_at_tb;

reg [1:0] in;
reg sel;
wire out_ter, out_case, out_ifel, out_for, out_aot;
integer i;

MUX UUT(in, out_ter, out_case, out_ifel, out_for, out_aot, sel);

initial begin
    for(i=0; i<4; i=i+1) begin
        in = i;
        sel = {$random} % 2;
        #1;
    end
    $finish;
end

endmodule