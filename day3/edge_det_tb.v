module eD_tb();

reg a_in, clk, reset;
wire pos_edge_o, neg_edge_o;
integer i;

edgeDetect UUT(a_in, clk, reset, pos_edge_o, neg_edge_o);

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    #10 reset = 1; a_in = 1;
    @(posedge clk);
    #10 reset = 0; 
    @(posedge clk);
    for (i = 0; i < 10; i = i + 1) begin
        #10 a_in = {$random} % 2;
        @(posedge clk);
    end

    $finish;
end

// dump vcd file
initial begin
    $dumpfile("edge_det_tb.vcd");
    $dumpvars(0, eD_tb);
end


endmodule
