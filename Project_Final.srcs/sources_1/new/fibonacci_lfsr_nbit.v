`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 01:53:58
// Design Name: 
// Module Name: fibonacci_lfsr_nbit
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
// Referenced from https://stackoverflow.com/questions/14497877/how-to-implement-a-pseudo-hardware-random-number-generator

module fibonacci_lfsr_nbit
    #(parameter BITS = 5)(
    input             clk,
    input             rst_n,
    output reg [4:0] data
    );

    reg [4:0] data_next;
    always_comb begin
        data_next = data;
        repeat(BITS) begin
            data_next = {(data_next[4]^data_next[1]), data_next[4:1]};
        end
    end

    always_ff @(posedge clk or negedge reset) begin
        if(!rst_n)
            data <= 5'h1f;
        else
            data <= data_next;
    end

endmodule
