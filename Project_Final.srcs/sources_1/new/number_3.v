`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 11:42:07
// Design Name: 
// Module Name: number_3
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


module number_3(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data
    );

    parameter [15:0] green = 16'b0000011111100000;
    always @(posedge clk) begin
        if (x >= 34 && x <= 61 && y >= 14 && y <= 17) oled_data <= green;
        else if (x >= 58 && x <= 61 && y >= 18 && y <= 29) oled_data <= green;
        else if (x >= 34 && x <= 61 && y >= 30 && y <= 33) oled_data <= green;
        else if (x >= 58 && x <= 61 && y >= 34 && y <= 45) oled_data <= green;
        else if (x >= 34 && x <= 61 && y >= 46 && y <= 49) oled_data <= green;
        else oled_data <= 0;
    end
endmodule
