`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 17:44:04
// Design Name: 
// Module Name: x1_constant
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


module x1_constant(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data 
    );
    parameter [15:0] white = 16'b11111_111111_11111;
    parameter [15:0] red = 16'b11111_000000_00000;
    parameter [15:0] blue = 16'b10100_011000_11011;

    always @(posedge clk) begin
        if ((x ==  62 && y ==  13 ) || 
        (x ==  61 && y ==  14 ) || 
        (x ==  62 && y ==  14 ) || 
        (x ==  62 && y ==  15 ) || 
        (x ==  62 && y ==  16 ) || 
        (x ==  51 && y ==  17 ) || 
        (x ==  52 && y ==  17 ) || 
        (x ==  57 && y ==  17 ) || 
        (x ==  58 && y ==  17 ) || 
        (x ==  61 && y ==  17 ) || 
        (x ==  62 && y ==  17 ) || 
        (x ==  63 && y ==  17 ) || 
        (x ==  51 && y ==  18 ) || 
        (x ==  52 && y ==  18 ) || 
        (x ==  57 && y ==  18 ) || 
        (x ==  58 && y ==  18 ) || 
        (x ==  51 && y ==  19 ) || 
        (x ==  52 && y ==  19 ) || 
        (x ==  57 && y ==  19 ) || 
        (x ==  58 && y ==  19 ) || 
        (x ==  51 && y ==  20 ) || 
        (x ==  52 && y ==  20 ) || 
        (x ==  57 && y ==  20 ) || 
        (x ==  58 && y ==  20 ) || 
        (x ==  53 && y ==  21 ) || 
        (x ==  54 && y ==  21 ) || 
        (x ==  55 && y ==  21 ) || 
        (x ==  56 && y ==  21 ) || 
        (x ==  53 && y ==  22 ) || 
        (x ==  54 && y ==  22 ) || 
        (x ==  55 && y ==  22 ) || 
        (x ==  56 && y ==  22 ) || 
        (x ==  51 && y ==  23 ) || 
        (x ==  52 && y ==  23 ) || 
        (x ==  57 && y ==  23 ) || 
        (x ==  58 && y ==  23 ) || 
        (x ==  51 && y ==  24 ) || 
        (x ==  52 && y ==  24 ) || 
        (x ==  57 && y ==  24 ) || 
        (x ==  58 && y ==  24 ) || 
        (x ==  51 && y ==  25 ) || 
        (x ==  52 && y ==  25 ) || 
        (x ==  57 && y ==  25 ) || 
        (x ==  58 && y ==  25 ) || 
        (x ==  51 && y ==  26 ) || 
        (x ==  52 && y ==  26 ) || 
        (x ==  57 && y ==  26 ) || 
        (x ==  58 && y ==  26 )) oled_data <= blue;
        else oled_data <= 0;
    end

endmodule