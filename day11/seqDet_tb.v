// Path: seqDet_tb.v
module seqDet_tb();

reg clk, reset, ser_in;
wire det_out;
integer i;

reg [11:0] seq = 12'b1110_1101_1011;
seqDet UUT(clk, reset, ser_in, det_out);

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    #10 reset = 1; ser_in = 1;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    for (i=0;i<12;i=i+1)begin
        ser_in <= seq[i];
        @(posedge clk);
    end

    for(i=0;i<12;i=i+1)begin
        ser_in = {$random} %2;
        @(posedge clk);
    end
    $finish;
end

endmodule 