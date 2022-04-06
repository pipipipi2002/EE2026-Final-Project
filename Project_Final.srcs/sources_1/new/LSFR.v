`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 02:01:57
// Design Name: 
// Module Name: LSFR
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

// Referenced from https://www.quora.com/What-would-be-the-verilog-code-for-8-bit-linear-feedback-shift-register


module LSFR (
    input clk,
    input rst,
    output reg [7:0] out 
    );
    wire feedback;
    assign feedback = ~(out[7] ^ out[6]);

    always @(posedge clk, negedge rst) begin
        if (!rst)   
            out <= 7'hFF;
        else
            out <= {out[6:0],feedback};
    end


endmodule

