`timescale 1ns / 1ps

module fwd(
input [2:0]EX_MEM_REG_RD,
input [2:0]ID_EX_REG_Rs1,
input [2:0]ID_EX_REG_Rs2,
output reg [1:0]fwd_sig,
input RegWrite_EX_WB
    );
    always@(*)
    begin
		if(EX_MEM_REG_RD==ID_EX_REG_Rs1&&RegWrite_EX_WB==1)
			begin
				assign fwd_sig=2'b01;
			end
		else if(EX_MEM_REG_RD==ID_EX_REG_Rs2&&RegWrite_EX_WB==1)
			begin
				assign fwd_sig=2'b10;
			end
		else if(EX_MEM_REG_RD==ID_EX_REG_Rs1 && EX_MEM_REG_RD==ID_EX_REG_Rs2&&RegWrite_EX_WB==1)
			begin
				assign fwd_sig=2'b11;
			end
		else
			begin
				assign fwd_sig=2'b00;
			end
    end
endmodule
