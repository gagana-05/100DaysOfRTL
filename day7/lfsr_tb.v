module tb_lfsr();

parameter N = 4;
integer i;
reg clk, reset;
wire [N-1:0] lfsr_out;

lfsr UUT(clk, reset, lfsr_out);

initial begin
    #5 clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    #10 reset = 0;
    #10 reset = 1;
    for (i=0; i<10; i = i+1) begin
        @(posedge clk);
    end
    $finish;
end
endmodule