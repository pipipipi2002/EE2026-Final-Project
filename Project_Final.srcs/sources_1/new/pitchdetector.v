`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 16:39:23
// Design Name: 
// Module Name: pitchdetector
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


module pitchdetector(
    input [11:0] mic_in,
    input clk,
    output [13:0] freq
    );
    reg [25:0] count;
    reg [13:0] freq_out;
    reg state = 0;
    assign freq = (freq_out < 9999) ? freq_out : 9999;
    
    initial begin
        count <= 0;
        freq_out <= 0;
    end
    
    wire positive;
    assign positive = (mic_in > 2048) ? 1 : 0;
    always @(posedge clk) 
    begin
        if (positive == 1) 
        begin
            count = count +1;
            state <= 0;
        end
        else
        begin
            if(state == 0) 
            begin
                state <=1;
                freq_out <= 25000000/(count*2);
            end
            else if(state == 1)
            begin
                count <= 0;
            end
        end
    end
     
endmodule


