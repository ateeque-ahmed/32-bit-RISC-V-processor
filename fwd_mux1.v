`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2022 12:38:13
// Design Name: 
// Module Name: fwd_mux1
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


module fwd_mux1(
input [7:0] data1,
input [7:0] fwd_reg_val,
input [1:0]cntrl_sign,
output reg [7:0] out1
    );
    
always@(*)
begin
    if(cntrl_sign==2'b01||cntrl_sign==2'b11)
    begin
        assign out1 = fwd_reg_val;
    end
    else
    begin
        assign out1 = data1;
    end
end
endmodule
