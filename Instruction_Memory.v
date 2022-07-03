`timescale 1ns / 1ps

module Instruction_Memory(
    input [7:0] PC,
    input reset,
    output [7:0] Instruction_Code
    );
reg [7:0] Mem [7:0];
assign Instruction_Code = Mem[PC];

always @(reset)
begin
if(reset==0)
begin
Mem[0]=8'b00100101; //add R4,R5
Mem[1]=8'b01100001; //sll R4, 1
Mem[2]=8'b00101100; //add R5, R4
Mem[3]=8'b11000001; //j L1
Mem[4]=8'b01101011; //sll R5,3
Mem[5]=8'b00011101; // L1: add R3, R5
end
end
endmodule
