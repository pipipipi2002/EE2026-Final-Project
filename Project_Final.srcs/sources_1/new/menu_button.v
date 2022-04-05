`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 17:25:59
// Design Name: 
// Module Name: menu_button
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


module menu_button(
    input pb_u,
    input pb_d,
    input BASYS_CLK,
    output reg [1:0] state = 0,
    input disabled
    );

    wire clk_100hz_out;
    flexible_clk clk0 (BASYS_CLK, 100, clk_100hz_out);

    reg [31:0] count = 0;
    always @(posedge clk_100hz_out) begin 
        if (disabled == 0) begin
        if (pb_u == 1) begin
            count <= (count < 10000) ? count + 1: 2;
            if (count == 1 && (state != 0)) begin
                state <= state - 1;
            end 
        end else begin
            count <= 0;
        end 
        
        if (pb_d == 1) begin
            count <= (count < 10000) ? count + 1: 2;
            if (count == 1 && state != 3) begin
                state <= state + 1;
            end 
        end else begin
            count = 0;
        end
        end 
    end

endmodule
