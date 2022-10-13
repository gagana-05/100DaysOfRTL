
module binToHot#(parameter BIN_W = 4, parameter ONE_HOT_W = 16)(bin, out);
   
    input [BIN_W-1:0] bin;
    output [ONE_HOT_W-1:0] out;
    assign out = 1 << bin;

endmodule



