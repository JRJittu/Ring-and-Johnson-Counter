`timescale 1ns / 1ps
module tb_ring_counter;

  	reg clk;
  	reg reset ;
  	wire [15:0] out;

  	initial begin
    		$dumpfile("ring_counter.vcd");
    		$dumpvars(0, tb_ring_counter);
  	end

  	ring_counter_16bit r1 (.clk(clk),.reset(reset),.out(out));

  	always #5 clk = ~clk;

  	initial begin
    	clk = 0;
    	reset = 1;

    	#20 reset = 0;
    	#250 $finish;
  	end

  	initial begin
    		$monitor(" reset=%1b, clock=%1b, count=%4b", reset ,clk, out);
  	end

endmodule