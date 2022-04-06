`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 02:47:13
// Design Name: 
// Module Name: spectrogram_top
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


module spectrogram_top(
    input CLOCK,
    input [11:0] sw,
    input [12:0] pixel_index,
    input [11:0] mic_in,
    output reg[11:0] led,
    output [15:0] oled_out,
    output reg [3:0]an = 4'b1110,
    output reg [6:0]seg = 7'b0111111
    );
    
    
    wire clock_20k_out;
    wire clock_25M_out;

    flexible_clk clock_20M (CLOCK,20000000,clock_25M_out);
    flexible_clk clock_20k (CLOCK,20000,clock_20k_out);
    
    wire [15:0] oled_data;

    wire [13:0] freq;
    reg [13:0] freq_in;
    pitchdetector pitch(mic_in, clock_25M_out,freq);

    wire [15:0] oled_data_spectogram;
    
    spectrogram spec(clock_20k_out,CLOCK,sw[4],mic_in,pixel_index, oled_data_spectogram);
    
    wire [3:0] an_freq;
    wire [6:0] led_freq;
    Seven_segment_LED_Display_Controller freq_disp(CLOCK,freq_in,an_freq,led_freq);

    always @ (posedge clock_20k_out)begin
        if(!sw[4]) freq_in <= freq;
    end
    
    always @ (posedge CLOCK)begin
        an <= an_freq;
        seg <= led_freq;
    end
    assign oled_data = oled_data_spectogram;
    assign oled_out = oled_data_spectogram;

endmodule
