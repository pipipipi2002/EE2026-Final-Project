`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2022 11:11:43
// Design Name: 
// Module Name: debouncer
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

/* Referenced from https://fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html */

module debouncer(
    input pb,
    input clk,
    output pb_out
    );
    wire slow_clk;
    wire Q1, Q2, Q2_bar, Q0;
    
    flexible_clk clk0 (clk, 400, slow_clk);
    
    dff d0 (slow_clk, pb, Q0);
    dff d1 (slow_clk, Q0, Q1);
    dff d2 (slow_clk, Q1, Q2);
    
    assign Q2_bar = ~Q2;
    assign pb_out = Q1 & Q2_bar;
endmodule    