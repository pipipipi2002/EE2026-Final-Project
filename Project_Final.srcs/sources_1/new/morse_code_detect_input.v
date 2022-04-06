`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 11:14:45
// Design Name: 
// Module Name: morse_code_detect_input
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


module morse_code_detect_input(
    input BASYS_CLK,
    input clk_20khz_out, pb_c,
    input [11:0] mic_in,
    output [7:0] data,
    input reset_data
    );

   
    reg reset = 0, reseted = 0;
    reg [11:0] current_peak = 0;
    reg [31:0] count_mic = 0;
    reg [31:0] count_running = 0;
    reg [31:0] count_1 = 0;
    reg [31:0] count_2 = 0;
    reg [31:0] count_diff = 0;
    reg start = 0, done = 0;

    reg [7:0] detected_value = 0; // 01 -> dot, 10 -> dash
    reg [3:0] pointer = 0;

    always @(posedge BASYS_CLK) begin
        if (pb_c == 1 || reset_data == 1) begin
            reset <= 1;
        end else if (reseted == 1) begin
            reset <= 0;
        end
    end

    always @(posedge clk_20khz_out) begin 
        if (reset != 1 && pointer == 8) begin 
            done = 1;
        end
        if (reset == 1) begin
            current_peak <= 0;
            count_mic <= 0;
            count_running <= 0;
            count_1 <= 0;
            count_2 <= 0;
            count_diff <= 0;
            detected_value <= 0;
            pointer <= 0;
            done <= 0;
            reseted <= 1;
            start <= 0;
        end else if (done == 0) begin
            reseted <= 0;
            count_mic <= count_mic + 1;
            if (mic_in > current_peak) begin
                current_peak <= mic_in;
            end

            if (count_mic == 3999) begin // we get a "peak" every 0.1s // 0.2
                count_running = count_running + 1;
                if (current_peak > 3000) begin 
                    count_2 = count_running;

                    if (start != 0) begin // not the starting
                        count_diff = count_2 - count_1;
                        if (count_diff < 3) begin // dot is detected
                            detected_value[pointer + 1] <= 0;
                            detected_value[pointer] <= 1;
                            pointer <= pointer + 2;
                        end else if (count_diff >= 3 && count_diff <= 10) begin
                            detected_value[pointer + 1] <= 1;
                            detected_value[pointer] <= 0;
                            pointer <= pointer + 2;
                        end
                    end else begin
                        start <= 1;
                    end
                    count_1 <= count_2;
                end            
                current_peak <= 0;
                count_mic <= 0;
            end
        end
    end

    assign data = detected_value;

endmodule
