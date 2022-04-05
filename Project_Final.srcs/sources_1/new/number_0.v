`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 08:45:54
// Design Name: 
// Module Name: number_0
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


module number_0(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data 
    );
    parameter [15:0] green = 16'b0000011111100000;

    always @(posedge clk) begin
        if ((x >= 38 && x <= 57 && y >= 18 && y <= 45)) begin
            oled_data <= 0;
        end else 
        if ((x >= 34 && x <= 61 && y >= 14 && y <= 49)) begin
            oled_data <= green;
        end else begin
            oled_data <= 0;
        end
    end
endmodule
