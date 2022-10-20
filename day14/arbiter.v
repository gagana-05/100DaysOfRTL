// Fixed Priority Arbiter 
// helps accessing the memory location for multiple process  and we can also provide a priority to a particular request
// Round Robin Arbiter - Starvation free Arbiter


// Specification:
// 4 input requests and output a signal to grant in the form of ONEHOT
// Request order 3>2>1>0


module fixedPriorityArbiter#(parameter N = 4)(clk, reset, request, grant);

input clk, reset;
input [N-1:0] request;
output reg [N-1:0] grant;
genvar i;
// considering port[3] as the highest priority
assign grant[3] = request[3];

always @(posedge clk or negedge reset)
begin
    for(i=0; i<N; i=i+1) begin
        grant[i] = request[i] & ~(!grant[i-1:0]);
 end
end

endmodule

