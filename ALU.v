`timescale 1ns / 1ps

module ALU(
input ALUOperation,
input [7:0]Data1,
input [7:0]Data2,
output reg [7:0]ALUResult,
output reg ZeroFlag
    );

always@(*)
begin
case(ALUOperation)
1'b0: ALUResult = Data1+Data2;
1'b1: ALUResult = Data1 << Data2[2:0];

endcase
end
always@(ALUResult)
begin
if(ALUResult == 0)
    assign ZeroFlag =1;
else
    ZeroFlag = 0;
end
endmodule
