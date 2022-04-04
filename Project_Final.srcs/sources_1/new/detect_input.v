`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2022 23:44:26
// Design Name: 
// Module Name: detect_input
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


module detect_input(
    input pushbutton,
    input clk,
    output pb_out
    );
    wire slow_clk;
    wire Q1, Q2, Q2_bar, Q0;

    flexible_clk clk0 (clk, 400, slow_clk);
    dff d0 (clk, pushbutton, Q0);
    dff d1 (clk, Q0, Q1);
    dff d2 (clk, Q1, Q2);
    
    assign Q2_bar = ~Q2;
    assign pb_out = Q1 & Q2_bar;
endmodule
