module odd_tb();
parameter N = 8;
reg clk, reset;
integer i;
wire [N-1:0] counter;

oddCounter UUT(counter, clk, reset);

initial begin
    clk = 1'b0;
    forever clk = #5 ~clk;
end

initial begin 
    #10 reset = 0;
    #10 reset = 1;
    for(i=0; i<128; i= i+1) 
	@(posedge clk);
    $finish;
end
endmodule
