`timescale 1ns / 1ps

module sign_extend_shamt(
    input [2:0] three_bit,
    output [7:0] eight_bit
    );

assign eight_bit={
three_bit[2],
three_bit[2],
three_bit[2],
three_bit[2],
three_bit[2],
three_bit};

endmodule
