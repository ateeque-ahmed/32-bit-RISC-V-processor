`timescale 1ns / 1ps

module Instruction_Fetch(
    input clk,
    input reset,
    output [7:0] Instruction_code
    );

reg [7:0]PC;
Instruction_Memory m0(PC, reset, Instruction_code);
wire [7:0]JumpAddress;
sign_extender s1(Instruction_code[5:0],JumpAddress);
always@(posedge clk, negedge reset)
begin
	if(reset == 0)
		PC <= 0;
	else if(Instruction_code[7:6]==2'b11)
		PC <= PC+1+JumpAddress;
    else
        PC <=PC+1;
end

endmodule
