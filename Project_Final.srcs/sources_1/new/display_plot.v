`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 21:22:13
// Design Name: 
// Module Name: display_plot
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


module display_plot(
    input clk,
    input [7:0] x, y,
    input [15:0] coe,
    input [4:0] degrees,
    output reg [15:0] oled_data,
    input [3:0] neg,
    input [2:0] scale
    );
    parameter [15:0] red = 16'b11111_000000_00000;
    parameter signed [7:0] x_offset = 47;
    parameter signed [7:0] y_offset = 31;


    wire signed [10:0] x0, x1, x2, x3, x0_n, x1_n, x2_n, x3_n, transformed;
    assign x0 = (degrees >= 1) ? coe[3:0] : 0;
    assign x1 = (degrees >= 2) ? coe[7:4] : 0;
    assign x2 = (degrees >= 4) ? coe[11:8] : 0;
    assign x3 = (degrees >= 8) ? coe[15:12] : 0;

    assign x0_n = (neg[0] == 1) ? -x0 : x0;
    assign x1_n = (neg[1] == 1) ? -x1 : x1;
    assign x2_n = (neg[2] == 1) ? -x2 : x2;
    assign x3_n = (neg[3] == 1) ? -x3 : x3;

    assign transformed = (scale == 0) ? 1 : (
                        (scale == 3'b001) ? 2 : (
                        (scale == 3'b010) ? 5 : (
                        (scale == 3'b100) ? 10 : 1)));


    wire signed [32:0] xs, ys, x_square, x_cube, x_ori;
    assign x_ori = x - x_offset;
    assign xs = (x / transformed) - (x_offset / transformed);
    assign ys = (y_offset - y);
    assign x_square = (degrees >= 4) ? xs * xs : 0;
    assign x_cube = (degrees >= 8) ? x_square * xs : 0;


    always @(posedge clk) begin
        if (x_ori % transformed != 0) oled_data <= 0;
        else if (x0_n + x1_n * xs + x2_n * x_square + x3_n * x_cube == ys) oled_data <= red;
        else oled_data <= 0;
    end 
endmodule
