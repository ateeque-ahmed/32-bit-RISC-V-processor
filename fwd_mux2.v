`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2022 12:47:45
// Design Name: 
// Module Name: fwd_mux2
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


module fwd_mux2(
input [7:0] data2,
input [7:0] fwd_reg_val,
input [1:0]cntrl_sign,
output reg [7:0] out2
    );
    
always@(*)
begin
    if(cntrl_sign==2'b10||cntrl_sign==2'b11)
    begin
        assign out2 = fwd_reg_val;
    end
    else
    begin
        assign out2 = data2;
    end
end
endmodule
