`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 11:42:07
// Design Name: 
// Module Name: number_1
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


module number_1(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data
    );
    parameter [15:0] green = 16'b0000011111100000;

    always @(posedge clk) begin
        if (x >= 44 && x <= 49 && (y == 14 || y ==15)) oled_data <= green;
        else if (x >= 42 && x <= 49 && (y == 16 || y == 17)) oled_data <= green;
        else if (x >= 40 && x <= 49 && (y == 18 || y == 19)) oled_data <= green;
        else if (x >= 38 && x <= 49 && (y == 20 || y == 21)) oled_data <= green;
        else if (x >= 46 && x <= 49 && y >= 22 && y <= 47) oled_data <= green;
        else if (x >= 36 && x <= 59 && (y == 48 || y == 49)) oled_data <= green;
        else oled_data <= 0;
    end
endmodule
