`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 18:06:25
// Design Name: 
// Module Name: num0_small
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


module num0_small(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data,
    input [2:0] degree,
    input [4:0] num
    );
    parameter [15:0] red = 16'b11111_000000_00000;
    wire [6:0] x_offset, y_offset;

    assign x_offset = (degree == 0 || degree == 2) ? 29 : 68;
    assign y_offset = (degree == 0 || degree == 1) ? 17 : 36;

    always @(posedge clk) begin
        if (num == 0 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  6 + x_offset && y ==  2  + y_offset) || 
            (x ==  7 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  6 + x_offset && y ==  3  + y_offset) || 
            (x ==  7 + x_offset && y ==  3  + y_offset) || 
            (x ==  0 + x_offset && y ==  4  + y_offset) || 
            (x ==  1 + x_offset && y ==  4  + y_offset) || 
            (x ==  6 + x_offset && y ==  4  + y_offset) || 
            (x ==  7 + x_offset && y ==  4  + y_offset) || 
            (x ==  0 + x_offset && y ==  5  + y_offset) || 
            (x ==  1 + x_offset && y ==  5  + y_offset) || 
            (x ==  6 + x_offset && y ==  5  + y_offset) || 
            (x ==  7 + x_offset && y ==  5  + y_offset) || 
            (x ==  0 + x_offset && y ==  6  + y_offset) || 
            (x ==  1 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  0 + x_offset && y ==  7  + y_offset) || 
            (x ==  1 + x_offset && y ==  7  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        
        else if (num == 1 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  2 + x_offset && y ==  2  + y_offset) || 
            (x ==  3 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  2 + x_offset && y ==  3  + y_offset) || 
            (x ==  3 + x_offset && y ==  3  + y_offset) || 
            (x ==  2 + x_offset && y ==  4  + y_offset) || 
            (x ==  3 + x_offset && y ==  4  + y_offset) || 
            (x ==  2 + x_offset && y ==  5  + y_offset) || 
            (x ==  3 + x_offset && y ==  5  + y_offset) || 
            (x ==  2 + x_offset && y ==  6  + y_offset) || 
            (x ==  3 + x_offset && y ==  6  + y_offset) || 
            (x ==  2 + x_offset && y ==  7  + y_offset) || 
            (x ==  3 + x_offset && y ==  7  + y_offset) || 
            (x ==  0 + x_offset && y ==  8  + y_offset) || 
            (x ==  1 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  0 + x_offset && y ==  9  + y_offset) || 
            (x ==  1 + x_offset && y ==  9  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;

        else if (num == 2 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  6 + x_offset && y ==  2  + y_offset) || 
            (x ==  7 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  6 + x_offset && y ==  3  + y_offset) || 
            (x ==  7 + x_offset && y ==  3  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  2 + x_offset && y ==  6  + y_offset) || 
            (x ==  3 + x_offset && y ==  6  + y_offset) || 
            (x ==  2 + x_offset && y ==  7  + y_offset) || 
            (x ==  3 + x_offset && y ==  7  + y_offset) || 
            (x ==  0 + x_offset && y ==  8  + y_offset) || 
            (x ==  1 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  6 + x_offset && y ==  8  + y_offset) || 
            (x ==  7 + x_offset && y ==  8  + y_offset) || 
            (x ==  0 + x_offset && y ==  9  + y_offset) || 
            (x ==  1 + x_offset && y ==  9  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset) || 
            (x ==  6 + x_offset && y ==  9  + y_offset) || 
            (x ==  7 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 3 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  6 + x_offset && y ==  2  + y_offset) || 
            (x ==  7 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  6 + x_offset && y ==  3  + y_offset) || 
            (x ==  7 + x_offset && y ==  3  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  0 + x_offset && y ==  6  + y_offset) || 
            (x ==  1 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  0 + x_offset && y ==  7  + y_offset) || 
            (x ==  1 + x_offset && y ==  7  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 4 && ((x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  2 + x_offset && y ==  2  + y_offset) || 
            (x ==  3 + x_offset && y ==  2  + y_offset) || 
            (x ==  4 + x_offset && y ==  2  + y_offset) || 
            (x ==  5 + x_offset && y ==  2  + y_offset) || 
            (x ==  2 + x_offset && y ==  3  + y_offset) || 
            (x ==  3 + x_offset && y ==  3  + y_offset) || 
            (x ==  4 + x_offset && y ==  3  + y_offset) || 
            (x ==  5 + x_offset && y ==  3  + y_offset) || 
            (x ==  0 + x_offset && y ==  4  + y_offset) || 
            (x ==  1 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  0 + x_offset && y ==  5  + y_offset) || 
            (x ==  1 + x_offset && y ==  5  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  0 + x_offset && y ==  6  + y_offset) || 
            (x ==  1 + x_offset && y ==  6  + y_offset) || 
            (x ==  2 + x_offset && y ==  6  + y_offset) || 
            (x ==  3 + x_offset && y ==  6  + y_offset) || 
            (x ==  4 + x_offset && y ==  6  + y_offset) || 
            (x ==  5 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  0 + x_offset && y ==  7  + y_offset) || 
            (x ==  1 + x_offset && y ==  7  + y_offset) || 
            (x ==  2 + x_offset && y ==  7  + y_offset) || 
            (x ==  3 + x_offset && y ==  7  + y_offset) || 
            (x ==  4 + x_offset && y ==  7  + y_offset) || 
            (x ==  5 + x_offset && y ==  7  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 5 && ((x ==  0 + x_offset && y ==  0  + y_offset) || 
            (x ==  1 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  6 + x_offset && y ==  0  + y_offset) || 
            (x ==  7 + x_offset && y ==  0  + y_offset) || 
            (x ==  0 + x_offset && y ==  1  + y_offset) || 
            (x ==  1 + x_offset && y ==  1  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  6 + x_offset && y ==  1  + y_offset) || 
            (x ==  7 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  0 + x_offset && y ==  4  + y_offset) || 
            (x ==  1 + x_offset && y ==  4  + y_offset) || 
            (x ==  2 + x_offset && y ==  4  + y_offset) || 
            (x ==  3 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  0 + x_offset && y ==  5  + y_offset) || 
            (x ==  1 + x_offset && y ==  5  + y_offset) || 
            (x ==  2 + x_offset && y ==  5  + y_offset) || 
            (x ==  3 + x_offset && y ==  5  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  0 + x_offset && y ==  8  + y_offset) || 
            (x ==  1 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  0 + x_offset && y ==  9  + y_offset) || 
            (x ==  1 + x_offset && y ==  9  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 6 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  0 + x_offset && y ==  4  + y_offset) || 
            (x ==  1 + x_offset && y ==  4  + y_offset) || 
            (x ==  2 + x_offset && y ==  4  + y_offset) || 
            (x ==  3 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  0 + x_offset && y ==  5  + y_offset) || 
            (x ==  1 + x_offset && y ==  5  + y_offset) || 
            (x ==  2 + x_offset && y ==  5  + y_offset) || 
            (x ==  3 + x_offset && y ==  5  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  0 + x_offset && y ==  6  + y_offset) || 
            (x ==  1 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  0 + x_offset && y ==  7  + y_offset) || 
            (x ==  1 + x_offset && y ==  7  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 7 && ((x ==  0 + x_offset && y ==  0  + y_offset) || 
            (x ==  1 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  0 + x_offset && y ==  1  + y_offset) || 
            (x ==  1 + x_offset && y ==  1  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  6 + x_offset && y ==  2  + y_offset) || 
            (x ==  7 + x_offset && y ==  2  + y_offset) || 
            (x ==  6 + x_offset && y ==  3  + y_offset) || 
            (x ==  7 + x_offset && y ==  3  + y_offset) || 
            (x ==  6 + x_offset && y ==  4  + y_offset) || 
            (x ==  7 + x_offset && y ==  4  + y_offset) || 
            (x ==  6 + x_offset && y ==  5  + y_offset) || 
            (x ==  7 + x_offset && y ==  5  + y_offset) || 
            (x ==  4 + x_offset && y ==  6  + y_offset) || 
            (x ==  5 + x_offset && y ==  6  + y_offset) || 
            (x ==  4 + x_offset && y ==  7  + y_offset) || 
            (x ==  5 + x_offset && y ==  7  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 8 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  6 + x_offset && y ==  2  + y_offset) || 
            (x ==  7 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  6 + x_offset && y ==  3  + y_offset) || 
            (x ==  7 + x_offset && y ==  3  + y_offset) || 
            (x ==  2 + x_offset && y ==  4  + y_offset) || 
            (x ==  3 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  2 + x_offset && y ==  5  + y_offset) || 
            (x ==  3 + x_offset && y ==  5  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  0 + x_offset && y ==  6  + y_offset) || 
            (x ==  1 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  0 + x_offset && y ==  7  + y_offset) || 
            (x ==  1 + x_offset && y ==  7  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  2 + x_offset && y ==  8  + y_offset) || 
            (x ==  3 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  2 + x_offset && y ==  9  + y_offset) || 
            (x ==  3 + x_offset && y ==  9  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red;
        else if (num == 9 && ((x ==  2 + x_offset && y ==  0  + y_offset) || 
            (x ==  3 + x_offset && y ==  0  + y_offset) || 
            (x ==  4 + x_offset && y ==  0  + y_offset) || 
            (x ==  5 + x_offset && y ==  0  + y_offset) || 
            (x ==  2 + x_offset && y ==  1  + y_offset) || 
            (x ==  3 + x_offset && y ==  1  + y_offset) || 
            (x ==  4 + x_offset && y ==  1  + y_offset) || 
            (x ==  5 + x_offset && y ==  1  + y_offset) || 
            (x ==  0 + x_offset && y ==  2  + y_offset) || 
            (x ==  1 + x_offset && y ==  2  + y_offset) || 
            (x ==  6 + x_offset && y ==  2  + y_offset) || 
            (x ==  7 + x_offset && y ==  2  + y_offset) || 
            (x ==  0 + x_offset && y ==  3  + y_offset) || 
            (x ==  1 + x_offset && y ==  3  + y_offset) || 
            (x ==  6 + x_offset && y ==  3  + y_offset) || 
            (x ==  7 + x_offset && y ==  3  + y_offset) || 
            (x ==  2 + x_offset && y ==  4  + y_offset) || 
            (x ==  3 + x_offset && y ==  4  + y_offset) || 
            (x ==  4 + x_offset && y ==  4  + y_offset) || 
            (x ==  5 + x_offset && y ==  4  + y_offset) || 
            (x ==  6 + x_offset && y ==  4  + y_offset) || 
            (x ==  7 + x_offset && y ==  4  + y_offset) || 
            (x ==  2 + x_offset && y ==  5  + y_offset) || 
            (x ==  3 + x_offset && y ==  5  + y_offset) || 
            (x ==  4 + x_offset && y ==  5  + y_offset) || 
            (x ==  5 + x_offset && y ==  5  + y_offset) || 
            (x ==  6 + x_offset && y ==  5  + y_offset) || 
            (x ==  7 + x_offset && y ==  5  + y_offset) || 
            (x ==  6 + x_offset && y ==  6  + y_offset) || 
            (x ==  7 + x_offset && y ==  6  + y_offset) || 
            (x ==  6 + x_offset && y ==  7  + y_offset) || 
            (x ==  7 + x_offset && y ==  7  + y_offset) || 
            (x ==  4 + x_offset && y ==  8  + y_offset) || 
            (x ==  5 + x_offset && y ==  8  + y_offset) || 
            (x ==  4 + x_offset && y ==  9  + y_offset) || 
            (x ==  5 + x_offset && y ==  9  + y_offset))) oled_data <= red; 
        else oled_data <= 0;
    end
endmodule
