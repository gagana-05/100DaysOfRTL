module sr_tb();
integer i;
reg clk, reset, din, load;
wire [3:0] sr_out;

shiftReg UUT(clk, reset, din, load, sr_out);

initial begin
    clk = 1'b0;
    forever clk = #5 ~clk;
end

initial begin
    #10 reset = 0; din = 0;
    #10 reset = 1; load = 1; din = 1;
    for(i = 0; i< 10; i = i+1) begin
        load = 0;
        din = {$random} % 2;
        @(posedge clk); end
    $finish;
end
endmodule