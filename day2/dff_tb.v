module tb_dff();

reg clk, d, reset;
wire q_asyncrst, q_syncrst, q_norst;

Dff UUT(clk, d, q_norst, q_syncrst, q_asyncrst, reset);

//generate clk
initial begin
    clk = 1'b0;
    forever clk = #5 ~clk;
end

//stimulas 
initial begin
    reset = 1'b1;
    d = 1'b1;

    repeat (2) @(posedge clk);
    reset = 1'b1;
    d = 1'b0;
    @(negedge clk);
    reset = 1'b0;
    $finish;
end

//generate vcd file
initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0, tb_dff);
    #100;
    $finish;
end

endmodule