`timescale 1ns / 1ps
module MUX(
    input shift_control,
    input [7:0] Data2,
    input [7:0] Shamt,
    output reg [7:0] ALU_input_2
    );
always@(*)
begin
if(shift_control)
begin
    ALU_input_2 = Shamt;
end
else
begin
    ALU_input_2 = Data2;
end
end
endmodule
