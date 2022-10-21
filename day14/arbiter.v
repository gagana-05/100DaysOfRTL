// Fixed Priority Arbiter 
// helps accessing the memory location for multiple process  and we can also provide a priority to a particular request
// Round Robin Arbiter - Starvation free Arbiter


// Specification:
// 4 input requests and output a signal to grant in the form of ONEHOT

module fixedPriorityArbiter  #(parameter N = 4)(request, grant);

input [N-1:0] request;
output [N-1:0] grant;
  // Port[0] has highest priority
  assign grant[0] = request[0];

  genvar i;
  for (i=1; i<N; i=i+1) begin
    assign grant[i] = request[i] & ~(|grant[i-1:0]);
  end

endmodule
