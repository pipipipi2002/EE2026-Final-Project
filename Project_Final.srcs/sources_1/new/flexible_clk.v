`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2022 17:48:43
// Design Name: 
// Module Name: flexible_clk
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


module flexible_clk(
    input BASYS_CLK,
    input [31:0] fd,
    output reg clk_out = 0
    );
    reg [31:0] count = 0;
    
    wire [31:0] m = (100000000 / (2 * fd)) - 1;
    
    always @(posedge BASYS_CLK) begin
        count <= (count == m) ? 0 : count + 1;
        clk_out <= (count == 0) ? ~clk_out : clk_out;
    end
endmodule
