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
    output out
    );
    wire Q1, Q2, Q2_bar, Q0;
    dff d0 (clk, pushbutton, Q0);
    dff d1 (clk, Q0, Q1);
    dff d2 (clk, Q1, Q2);
    
    assign Q2_bar = ~Q2;
    assign out = Q1 & Q2_bar;
endmodule
