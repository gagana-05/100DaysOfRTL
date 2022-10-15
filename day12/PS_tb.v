module tb_pToS();

reg clk, reset;
integer i;
wire empty_o, valid_o, serial_o;
reg [3:0] parallel_i;

pToSReg UUT(clk, reset, empty_o, parallel_i, serial_o, valid_o);

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end


initial begin 
    $display("parallel_i = %b", parallel_i);
    reset = 1; parallel_i = {$random} %16;
    #10 reset = 0;
    for(i = 0; i < 10; i = i + 1) begin
        @(posedge clk);
        #10;
    end
    $finish;
end

endmodule