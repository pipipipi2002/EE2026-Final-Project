`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 08:46:48
// Design Name: 
// Module Name: morse_code_top
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


module morse_code_top(
    input BASYS_CLK,
    input [6:0] x, y,
    input clk_20khz_out, pb_c,
    input [11:0] mic_in,
    output reg [6:0] seg,
    output [15:0] oled_data,
    output reg [3:0] an,
    output [9:0] led
    );
    
    wire [9:0] data;
    morse_code_detect_input detect_input0 (BASYS_CLK, clk_20khz_out, pb_c, mic_in, data);

    assign led = data;
    
endmodule
