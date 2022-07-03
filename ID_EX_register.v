`timescale 1ns / 1ps

module ID_EX_register(

input RegWrite_cntrl,
input ALUcntrl_cntrl,
input [7:0]Data1_reg,
input [7:0]Data2_reg,
input [2:0] Rd_IF_ID,
input [2:0]Rs1,
input [2:0]Rs2,
input clk,
input rst,
output reg RegWrite_ID_EX,
output reg ALUcntrl_IF_ID,
output reg [7:0]Data1_ID_EX,
output reg [7:0]Data2_ID_EX,
output reg [2:0] Rd_ID_EX,
output reg[2:0]Rs1_ID_EX,
output reg[2:0]Rs2_ID_EX
    );
always@(posedge clk, negedge rst)
if(rst==0)
begin
    RegWrite_ID_EX = 0;
    ALUcntrl_IF_ID = 0;
    Data1_ID_EX = 0;
    Data2_ID_EX = 0;
    Rd_ID_EX = 0;
    Rs1_ID_EX=0;
    Rs2_ID_EX=0; 
end
else
begin
    RegWrite_ID_EX = RegWrite_cntrl;
    ALUcntrl_IF_ID = ALUcntrl_cntrl;
    Data1_ID_EX = Data1_reg;
    Data2_ID_EX = Data2_reg;
    Rd_ID_EX = Rd_IF_ID; 
    Rs1_ID_EX = Rs1;
    Rs2_ID_EX = Rs2;
end
endmodule
