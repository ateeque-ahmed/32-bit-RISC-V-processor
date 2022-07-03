`timescale 1ns / 1ps
module register_file(
    input [2:0] Read_Reg_Num_1,
    input [2:0] Read_Reg_Num_2,
    input [2:0] Write_Reg_Num,
    output [7:0] Read_Data_1,
    output [7:0] Read_Data_2,
    input [7:0] Write_Data,
    input RegWrite,
    //input clk,
    input Reset
    );
    integer i;
    reg [7:0] RegMem [7:0];
    
    always@(*)
    begin
    if(Reset==0)
    begin
    RegMem[0]=8'b00000000;
    RegMem[1]=8'b00000001;
    RegMem[2]=8'b00000010;
    RegMem[3]=8'b00000011;
    RegMem[4]=8'b00000100;
    RegMem[5]=8'b00000101;
    RegMem[6]=8'b00000110;
    RegMem[7]=8'b00000111;
    
    end
    else if(RegWrite)
    begin
     RegMem[Write_Reg_Num]=Write_Data;
    end
    end

    assign Read_Data_1=RegMem[Read_Reg_Num_1];
    assign Read_Data_2=RegMem[Read_Reg_Num_2];
endmodule