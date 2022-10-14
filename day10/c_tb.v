// Path: count_load_tb.v
module c_tb();

reg clk, reset, load;
reg [3:0] load_val;
wire [3:0] out;
integer i;

countLoad UUT(clk, reset, load, load_val, out);

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    #10 reset = 0; load = 0; load_val = $random % 16;
    #10 reset = 1; load = 1;
    #10 load = 0; reset = 0;
    for(i=0;i<20;i= i+1)begin
        @(posedge clk);
        #10;
    end
    $finish;
end

endmodule