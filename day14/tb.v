module tb_PFA();
  parameter N = 4;
  reg [N-1:0] request;
  wire [N-1:0] grant;
  integer i;


fixedPriorityArbiter UUT(request, grant);

initial begin
    for(i=0; i<16; i=i+1) begin
        request = {$random} % 16;
        #5;
end
$finish;
end
endmodule