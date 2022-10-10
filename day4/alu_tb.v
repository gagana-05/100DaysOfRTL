module alu_tb();

reg [7:0] a, b;
reg [2:0] sel;
reg clk, reset;
wire [7:0] out;
integer i;

alu uut(.a(a), .b(b), .out(out), .sel(sel), .clk(clk), .reset(reset));

initial begin 
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    reset = 1;
    #10 reset = 0; a = 8'd25; b = 8'd5;
    for( i=0; i<8; i=i+1) begin
        sel = i;
        #10;
    end
    #10 $finish;
end


// dump vcd file 
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
end
endmodule
