`timescale 1ns / 1ps
module Main_processor(
    input clk,
    input rst
    );
wire RegWrite;
wire [7:0]ALUResult;
wire ALUOperation,ALUOperation_ID_EX; 
wire [7:0]Data1;
wire [7:0]Data2;
wire ZeroFlag;
wire [7:0]instruction_code;
wire [7:0]Instruction_code_if_id;
wire RegWrite_ID_EX;
wire ALUcntrl_ID_EX;
wire [7:0]Data1_ID_EX;
wire [7:0]Data2_ID_EX;
wire [2:0] Rd_ID_EX;
wire RegWrite_EX_WB;
wire [7:0] ALU_result_EX_WB;
wire [2:0] rd_EX_WB;
wire shift_control;
wire [7:0]ALU_input_2;
wire [7:0]shamt_value;
wire [7:0]out1;
wire [7:0]out2;
wire [2:0]Rs1_ID_EX,Rs2_ID_EX;
wire [1:0]fwd_cntrl;
wire [7:0]shamt_val_id_ex;

//Instruction Fetch
Instruction_Fetch i_fetch(clk, rst, instruction_code);

//IF/ID Register
IF_ID_register if_id(clk, rst, instruction_code, Instruction_code_if_id);

//Control Unit
control_unit cu(Instruction_code_if_id[7:6],shift_control,RegWrite, ALUOperation);

//Register File
register_file rf(
Instruction_code_if_id[5:3],
Instruction_code_if_id[2:0],
rd_EX_WB,
Data1,
Data2,
ALU_result_EX_WB,
RegWrite_EX_WB,rst);

//sign Extender for shift value
sign_extend_shamt s2(Instruction_code_if_id[2:0],shamt_value); 


//MUX before ALU
MUX mux_alu(shift_control,Data2,shamt_value,ALU_input_2);

//ID/EX Register
ID_EX_register id_ex(
RegWrite, 
ALUOperation,
Data1,
ALU_input_2,
Instruction_code_if_id[5:3],
Instruction_code_if_id[5:3],
Instruction_code_if_id[2:0],
clk, rst,
RegWrite_ID_EX,
ALUcntrl_ID_EX, 
Data1_ID_EX,
Data2_ID_EX,
Rd_ID_EX,
Rs1_ID_EX,
Rs2_ID_EX);

//MUX 1
fwd_mux1 f1(Data1_ID_EX,ALU_result_EX_WB,fwd_cntrl,out1);

//MUX 2
fwd_mux2 f2(Data2_ID_EX,ALU_result_EX_WB,fwd_cntrl,out2);

//ALU
ALU alu(ALUcntrl_ID_EX, out1, out2, ALUResult, ZeroFlag);

//EX/WB Register
EX_WB_register ex_wb(RegWrite_ID_EX,ALUResult,Rd_ID_EX,RegWrite_EX_WB,ALU_result_EX_WB,rd_EX_WB,clk,rst);

//forward
fwd f(rd_EX_WB,Rs1_ID_EX,Rs2_ID_EX,fwd_cntrl,RegWrite_EX_WB);

endmodule
