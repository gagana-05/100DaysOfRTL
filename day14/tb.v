module tb_PFA();
  parameter N = 4;
  reg clk, reset;
  reg [N-1:0] request;
  wire [N-1:0] grant;
  integer i;


fixedPriorityArbiter UUT(clk, reset, request, grant);

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    reset = 0;
    #10 reset = 1;
    for(i=0; i<16; i=i+1) begin
        @(posedge clk);
        request = i;
end
$finish;
end
endmodule