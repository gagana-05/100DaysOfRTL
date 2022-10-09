module tb();

reg [7:0] a, b;
reg sel;
wire [7:0] out;
integer i;

mux mux1(a, b, sel, out);

initial begin
    for(i=0; i<8; i=i+1) begin
        a = $random;
        b = $random;
        sel = {$random} % 2;
        #5;
    end
end


initial begin 
    $dumpfile("mux_tb.vcd");
    $dumpvars(0, tb);
    #100;
    $finish;
end

endmodule