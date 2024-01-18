module Jc_tb;

  reg clk, reset;
  wire [15:0] out;

  initial begin
    $dumpfile("johnson.vcd");
    $dumpvars(0, Jc_tb);
  end

  jc_16bit j (.out(out),.reset(reset),.clk(clk));

  always #5 clk =~clk;

  initial begin
    reset = 1'b1;
    clk = 1'b0;
    #20 reset= 1'b0;
  end

  initial begin
    $monitor("reset=%b, clk=%b, out=%b", reset, clk, out);
    #250 $finish;
  end

endmodule