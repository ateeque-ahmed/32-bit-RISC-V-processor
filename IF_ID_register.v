`timescale 1ns / 1ps

module IF_ID_register(
input clk,
input reset,
input [7:0]Instruction_code_if,
//input regwrite,
output reg [7:0]Instruction_code_if_id
//output reg regwrite_if_id
    );
always@(posedge clk, negedge reset)
if(reset == 0)
begin
    Instruction_code_if_id = 8'b0;
	 //regwrite_if_id = 0;
end
else
begin
    Instruction_code_if_id = Instruction_code_if;
	 //regwrite_if_id = regwrite;
end
endmodule
