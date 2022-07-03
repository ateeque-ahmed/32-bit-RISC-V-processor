`timescale 1ns / 1ps

module Testbench;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	Main_processor uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
	clk = 0;
forever #10 clk = ~clk;
end

initial begin
rst = 1;
#15 rst = 0;#10
rst = 1;
#180;
$finish; 
end
      
endmodule

