module jc_16bit(clk, reset, out);
  	input clk, reset;
  	output [15:0] out;
  	reg [15:0] dfr1;

  	always @(posedge clk or posedge reset)
  	begin
    		if (reset)
      			dfr1 <= 16'b0000000000000000;
    		else begin
      			dfr1[15] <= dfr1[14];
      			dfr1[14] <= dfr1[13];
      			dfr1[13] <= dfr1[12];
      			dfr1[12] <= dfr1[11];
      			dfr1[11] <= dfr1[10];
      			dfr1[10] <= dfr1[9];
      			dfr1[9] <= dfr1[8];
      			dfr1[8] <= dfr1[7];
      			dfr1[7] <= dfr1[6];
      			dfr1[6] <= dfr1[5];
      			dfr1[5] <= dfr1[4];
      			dfr1[4] <= dfr1[3];
     			dfr1[3] <= dfr1[2];
      			dfr1[2] <= dfr1[1];
      			dfr1[1] <= dfr1[0];
      			dfr1[0] <= ~dfr1[15];
    		end
  	end

  	assign out = dfr1;

endmodule