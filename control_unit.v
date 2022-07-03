`timescale 1ns / 1ps

module control_unit(
input [1:0]opcode,
output reg shift_control,
output reg RegWrite,
output reg ALUOperation
);
always@(*)
begin
if(opcode==2'b00||opcode==2'b01||opcode==2'b11)
begin
RegWrite = 1'b1;
end
ALUOperation = opcode[0];
if(opcode == 2'b01)
begin
shift_control = 1'b1;
end
else
begin
shift_control = 1'b0;
end
end
endmodule

