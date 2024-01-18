module invert_16bit (input wire [15:0] i,output wire [15:0] o);
  	assign o = ~i;
endmodule


module invert_2bit(input wire i,output wire o);
	assign o = !i;
endmodule


module and2_16bit (input wire [15:0] i0, i1,output wire [15:0] o);
  	assign o = i0 & i1;
endmodule


module mux2_16bit (input wire [15:0] i0, i1,input wire j,output wire [15:0] o);
  	assign o = (j == 0) ? i0 : i1;
endmodule


module df_16bit (input wire clk,input wire [15:0] in,output wire [15:0] out);
  	reg [15:0] df_out;
  	always @(posedge clk) df_out <= in;
  	assign out = df_out;
endmodule


module dfr_16bit (input wire clk, input wire reset, input wire [15:0] in, output wire [15:0] out);
    	wire [15:0] df_in, clk_;
	wire [15:0] extend_reset;

    	invert_2bit i0 (.i(reset), .o(reset_));
	
	assign extend_reset = {16{reset}};
    	and2_16bit and2_0 (.i0(in), .i1(extend_reset), .o(df_in));

    	df_16bit df_0 (.clk(clk), .in(df_in), .out(out));

endmodule


module dfl_16bit (input wire clk, load,input wire [15:0] in,output wire [15:0] out);
  	wire [15:0] _in;
  	mux2_16bit mux2_0 (.i0(out), .i1(in), .j(load), .o(_in));
  	df_16bit df_1 (.clk(clk), .in(_in), .out(out));
endmodule