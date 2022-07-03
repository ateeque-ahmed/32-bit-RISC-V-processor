`timescale 1ns / 1ps

module sign_extender(
input [5:0] writeData6,
output [7:0] writeData8
);
assign writeData8 = {
writeData6[5],
writeData6[5],
writeData6};
endmodule
