`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2022 17:23:44
// Design Name: 
// Module Name: clk_20khz
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


module clk_20khz(
    input BASYS_CLK,
    output reg clk_out = 0
    );
    
    reg [31:0] count = 0;
    always @(posedge BASYS_CLK) begin
        count <= (count == 2499) ? 0 : count + 1;
        clk_out <= (count == 0) ? ~clk_out : clk_out;
    end
endmodule
