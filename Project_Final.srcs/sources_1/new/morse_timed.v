`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 23:02:09
// Design Name: 
// Module Name: morse_timed
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


module morse_timed(
    input [7:0] data,
    input oled_clk, BASYS_CLK,
    input [6:0] x, y,
    input [4:0] character,
    output reg [15:0] led = 16'b1111111111111111,
    output [15:0] oled_data,
    output correct_out);

    wire slow_clk;
    flexible_clk slowslow_5clk (BASYS_CLK, 5, slow_clk); // 0.2s
    
    reg timeup = 0;

    reg [31:0] count = 0;

    reg [7:0] char_byte, char_byte_prev;
    wire [15:0] tick_oled_data, correct_temp;

    reg correct_detected;
    reg [31:0] correct_count = 0;
    reg correct=0;

    always @(posedge BASYS_CLK) begin
        count <= (count == 24999999) ? 0 : count + 1; // 2hz
        if (count == 24999999 && correct_detected == 0) begin
            led <= led >> 1;
        end

        if (led == 0) timeup <= 1;

        case (character)
            0: char_byte <= 8'b00_00_10_01; // A
            1: char_byte <= 8'b01_01_01_10; // B
            2: char_byte <= 8'b01_10_01_10; // C
            3: char_byte <= 8'b00_01_01_10; // D
            4: char_byte <= 8'b00_00_00_01; // E
            5: char_byte <= 8'b01_10_01_01; // F
            6: char_byte <= 8'b00_01_10_10; // G
            7: char_byte <= 8'b01_01_01_01; // H
            8: char_byte <= 8'b00_00_01_01; // I
            9: char_byte <= 8'b10_10_10_01; // J 
            10: char_byte <= 8'b00_10_01_10;  // K
            11: char_byte <= 8'b01_01_10_01;  // L
            12: char_byte <= 8'b00_00_10_10;  // M
            13: char_byte <= 8'b00_00_01_10;  // N
            14: char_byte <= 8'b00_10_10_10;  // O
            15: char_byte <= 8'b01_10_10_01; // P
            16: char_byte <= 8'b10_01_10_10; // Q
            17: char_byte <= 8'b00_01_10_01; // R
            18: char_byte <= 8'b00_01_01_01; // S
            19: char_byte <= 8'b00_00_00_10; // T
            20: char_byte <= 8'b00_10_01_01; // U
            21: char_byte <= 8'b10_01_01_01; // V
            22: char_byte <= 8'b00_10_10_01; // W
            23: char_byte <= 8'b10_01_01_10; // X
            24: char_byte <= 8'b10_10_01_10;  // Y
            25: char_byte <= 8'b01_01_10_10;  // Z
        endcase

        if (char_byte_prev != char_byte) begin
            led <= 16'b1111111111111111;
            timeup <= 0;
        end else 
            char_byte_prev <= char_byte;
        
    end


    always @(posedge slow_clk) begin
        if (char_byte == data) begin 
            correct_detected <= 1;
        end
        else correct_detected <= 0;

        if (correct_detected == 1) begin
            if (correct_count == 7) begin
                correct <= 1;
                correct_detected <= 0;
                correct_count <= 0;
            end else correct_count <= correct_count + 1;
        end else correct <= 0;
    end

    wire [15:0] AJ_oled_data, KT_oled_data, UZ_oled_data, timeup_oled_data;
    morse_code_tick tick0 (oled_clk, x, y, tick_oled_data);
    morse_characterAJ AJ0 (oled_clk, x, y, character, AJ_oled_data);
    morse_characterKT KT0 (oled_clk, x, y, character, KT_oled_data);
    morse_characterUZ UZ0 (oled_clk, x, y, character, UZ_oled_data);
    morse_code_timeup timeup0 (oled_clk, x, y, timeup_oled_data);

    assign correct_out = (timeup == 1) ? 1 : correct;
    assign correct_temp = (correct_detected == 1 && timeup != 1) ? tick_oled_data : 0;
    assign oled_data = (timeup == 1) ? timeup_oled_data : ( correct_temp | ((character >= 0 && character <= 9) ? (AJ_oled_data) : (
                        (character >= 10 && character <= 19) ? (KT_oled_data) : (
                        (character >= 20 && character <= 25) ? (UZ_oled_data): 0))));

endmodule
