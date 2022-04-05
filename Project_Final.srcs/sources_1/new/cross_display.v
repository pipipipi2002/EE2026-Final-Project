`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 09:32:23
// Design Name: 
// Module Name: cross_display
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


module cross_display(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data 
    );
    parameter [15:0] red = 16'b11111_000000_00000;
    always @(posedge clk) begin
        if (x >= 28 && x <= 33 && (y == 14 || y == 15 || y == 48 || y == 49))  oled_data <= red;
        else if (x >= 62 && x <= 67 && (y == 14 || y == 15 || y == 48 || y == 49)) oled_data <= red;

        else if (x >= 30 && x <= 35 && (y == 16 || y == 17 || y == 46 || y == 47)) oled_data <= red;
        else if (x >= 60 && x <= 65 && (y == 16 || y == 17 || y == 46 || y == 47)) oled_data <= red;
        
        else if (x >= 32 && x <= 37 && (y == 18 || y == 19 || y == 44 || y == 45)) oled_data <= red;
        else if (x >= 58 && x <= 63 && (y == 18 || y == 19 || y == 44 || y == 45)) oled_data <= red;
        
        else if (x >= 34 && x <= 39 && (y == 20 || y == 21 || y == 42 || y == 43)) oled_data <= red;
        else if (x >= 56 && x <= 61 && (y == 20 || y == 21 || y == 42 || y == 43)) oled_data <= red;
        
        else if (x >= 36 && x <= 41 && (y == 22 || y == 23 || y == 40 || y == 41)) oled_data <= red;
        else if (x >= 54 && x <= 59 && (y == 22 || y == 23 || y == 40 || y == 41)) oled_data <= red;
        
        else if (x >= 38 && x <= 43 && (y == 24 || y == 25 || y == 38 || y == 39)) oled_data <= red;
        else if (x >= 52 && x <= 57 && (y == 24 || y == 25 || y == 38 || y == 39)) oled_data <= red;
        
        else if (x >= 40 && x <= 45 && (y == 26 || y == 27 || y == 36 || y == 37)) oled_data <= red;
        else if (x >= 50 && x <= 55 && (y == 26 || y == 27 || y == 36 || y == 37)) oled_data <= red;
        
        else if (x >= 42 && x <= 53 && (y == 28 || y == 29)) oled_data <= red;
        else if (x >= 44 && x <= 51 && (y == 30 || y == 31 || y == 32 || y == 33)) oled_data <= red;
        else if (x >= 42 && x <= 53 && (y == 34 || y == 35)) oled_data <= red;

        else oled_data <= 0;
    end
        
endmodule
