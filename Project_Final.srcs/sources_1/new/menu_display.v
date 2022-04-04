`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 18:13:42
// Design Name: 
// Module Name: menu_display
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


module menu_display(
    input [1:0] state,
    input master_clk,
    input clk,
    input [7:0] x, y,
    output [15:0] oled_data
    );

    wire slow_clk;
    flexible_clk clk0 (master_clk, 2, slow_clk); 

    wire [15:0] board_oled, moving_oled, selector_oled, words_oled;
    display_bg_board board0 (clk, x, y, board_oled);                    // static
    display_bg_words words0 (clk, x, y, words_oled);                    // static
    display_bg_moving moving0 (clk, slow_clk, x, y, moving_oled);       // moving based continuously
    display_bg_selector selector0 (clk, x, y, selector_oled, state);    // moving based on state

    wire [15:0] static_word, menu;

    assign static_word = words_oled | selector_oled;
    assign menu = (static_word != 0) ? static_word : moving_oled;
    assign oled_data = (menu != 0) ? menu : board_oled;
endmodule
