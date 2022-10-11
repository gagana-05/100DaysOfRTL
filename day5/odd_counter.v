module oddCounter #(parameter N =8) (counter, clk,reset); 
  
  input clk, reset;
  output [N-1:0] counter;
  
  reg [N-1:0] count;
  assign counter = count;
  always @(posedge clk) begin 
    if(!reset) 
      count <= 8'b1;
    else 
      count <= count + 2 ;
  end 
  endmodule
