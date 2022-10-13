module tb_bo();

    parameter BIN_W = 4, ONE_HOT_W = 16;
    integer i;
    reg [BIN_W-1:0] bin;
    wire [ONE_HOT_W-1:0] out;

    binToHot UUT(bin, out);

    initial begin 
        for(i=0; i<16; i=i+1) begin
            bin = i;
            #10;
        end
        $finish;
    end
endmodule