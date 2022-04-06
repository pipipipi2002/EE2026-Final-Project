`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 08:46:48
// Design Name: 
// Module Name: morse_code_top
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


module morse_code_top(
    input BASYS_CLK,
    input [12:0] pixel_index,
    input clk_20khz_out, clk_6_25Mhz_out, pb_c,
    input [11:0] mic_in,
    input [1:0] menu_sw,        // sw 1 and sw 0
    output reg [6:0] seg,
    output [15:0] oled_data,
    output reg [3:0] an,
    output [15:0] led,
    output dp
    );
    
    wire slow_clk;
    flexible_clk clkslow (BASYS_CLK, 1, slow_clk);

    wire [6:0] x,y;
    PItoXY convert1 (pixel_index, x, y);

    wire [7:0] data, random_letters; 
    reg [4:0] character;
    wire reset_lsfr; 
    wire next_letter_to_change, next_letter_practice, next_letter_timed; // pulse of next_letter is sufficient to change it
    wire [15:0] menu_oled_data, practice_oled_data, timed_oled_data;

    
    morse_code_detect_input detect_input0 (BASYS_CLK, clk_20khz_out, pb_c, mic_in, data, next_letter_to_change); // correct signal here will clear data
    LSFR lsfr0 (slow_clk, 1, random_letters);
    
    
    
    wire[3:0]morse_display_an;
    wire[6:0]morse_display_seg;
    wire morse_display_dp;
    
    morse_anode_disp morse_anode_disp0(BASYS_CLK, data, morse_display_an, morse_display_seg, morse_display_dp);
  

    reg start = 0;
    always @(posedge BASYS_CLK) begin
        if (next_letter_practice == 1 ||next_letter_timed == 1 || start == 0) begin
            character <= random_letters % 26;
            start <= 1;
        end
    end

    morse_code_menu mourse_code_menu0 (clk_6_25Mhz_out, pixel_index, menu_oled_data);

    morse_practice practice0 (data, clk_6_25Mhz_out, BASYS_CLK, x, y, character, practice_oled_data, next_letter_practice);
    morse_timed timed0 (data, clk_6_25Mhz_out, BASYS_CLK, x, y, character, led, timed_oled_data, next_letter_timed);

    // assign next_letter = correct;

    // menu_sw 
        // 00: nothing selected
        // 01: right
        // 10: left

    assign oled_data =  (menu_sw == 0) ? (menu_oled_data) : (
                        (menu_sw == 1) ? (timed_oled_data) : (
                        (menu_sw == 2) ? (practice_oled_data) : menu_oled_data ));
                        
    assign next_letter_to_change =  (menu_sw == 0) ? (0) : (
                                    (menu_sw == 1) ? (next_letter_timed) : (
                                    (menu_sw == 2) ? (next_letter_practice) : 0));
      
endmodule
