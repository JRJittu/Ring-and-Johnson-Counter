module ring_counter_16bit (
  	input clk, reset ,
  	output wire [15:0] out
);
  	reg [15:0] cnt;

  	always @(posedge clk or posedge reset )
    		if (reset )
      			cnt <= 16'b0000000000000001;
    		else
      			cnt <= {cnt[14:0], cnt[15]};

  	assign out = cnt;

endmodule
