`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 16:28:17
// Design Name: 
// Module Name: EX_WB_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_WB_register(
    input RegWrite_ID_EX,
    input [7:0] ALU_result_alu,
    input [2:0] rd,
    output reg RegWrite_EX_WB,
    output reg [7:0] ALU_result_EX_WB,
    output reg [2:0] rd_EX_WB,
    input clk,
    input rst
    );
always@(posedge clk, negedge rst)
if(rst==0)
begin
    RegWrite_EX_WB = 0;
    ALU_result_EX_WB = 0;
    rd_EX_WB = 0;
end
else
begin
    RegWrite_EX_WB = RegWrite_ID_EX;
    ALU_result_EX_WB = ALU_result_alu;
    rd_EX_WB = rd;
end
endmodule
