`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): THURSDAY A.M.
//
//  STUDENT A NAME: Marvin Pranajaya
//  STUDENT A MATRICULATION NUMBER: A0239085X
//
//  STUDENT B NAME: Amit 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input BASYS_CLK,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [9:0] led_out,
    input sw, pb_u, pb_d, pb_c, pb_r,
    input sub_4hide, sub_4, sub_4AorB,
    output [6:0] JX,
    output reg [3:0] an = 4'b1110, 
    output [6:0] seg,
    output dp
    );
    assign dp = 1;
    wire clk_10hz_out, clk_100hz_out, clk_400hz_out;
    flexible_clk clk_10Hz (BASYS_CLK, 10, clk_10hz_out);
    flexible_clk clk_100Hz (BASYS_CLK, 100, clk_100hz_out);
    flexible_clk clk_400Hz (BASYS_CLK, 400, clk_400hz_out);
    
    /* Mic Configuration */
    // mic_in -> data coming in
    wire clk_20khz_out;
    wire [11:0] mic_in;
    flexible_clk clk_20kHz (BASYS_CLK, 20000, clk_20khz_out);
    Audio_Capture aud0 (.CLK(BASYS_CLK), .cs(clk_20khz_out), .MISO(J_MIC3_Pin3), 
                        .clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_in));

    
    /* Oled Configuration */
    // oled_data -> Colour RGB
    // pixel_index -> to figure out the pointer of the oled pixel currently
    wire [15:0] oled_data;
    wire clk_6_25Mhz_out;
    flexible_clk clk6p25m (BASYS_CLK, 6250000, clk_6_25Mhz_out);
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display display0 (.clk(clk_6_25Mhz_out), .reset(0), .pixel_data(oled_data), 
                .frame_begin(frame_begin), .pixel_index(pixel_index), .sending_pixels(sending_pixels), .sample_pixel(sample_pixel), 
                .cs(JX[0]), .sdin(JX[1]), .sclk(JX[2]), .d_cn(JX[3]), .resn(JX[4]), .vccen(JX[5]), .pmoden(JX[6]), .teststate());

    
    
    wire [6:0] cX,cY;
    PItoXY convert0 (pixel_index, cX, cY);
    
    wire [15:0] subtask42_oled_data;
    wire [4:0] subtask42_led_data;
    subtask4_2 subtask4_20 (cX, cY, clk_6_25Mhz_out, clk_20khz_out, sub_4hide, sub_4, sub_4AorB, mic_in, seg, subtask42_oled_data, subtask42_led_data);
    

    /* menu button */
    // state 0 -> Subtask 4.2
    // state 1 -> Audio Spectogram
    // state 2 -> Polynomial Plotter
    // state 3 -> M-O-R-S-E code !
    wire [1:0] state; 
    wire [15:0] mainmenu_oled_data;
    menu_button menu_button0 (pb_u, pb_d, BASYS_CLK, state);
    menu_display menu0 (state, BASYS_CLK, clk_6_25Mhz_out, cX, cY, mainmenu_oled_data);
    
    wire pb_c_out, pb_r_out;
    reg set_c = 0; 

    detect_input detect_input_c (pb_c, BASYS_CLK, pb_c_out);
    detect_input detect_input_r (pb_r, BASYS_CLK, pb_r_out);

    always @(posedge BASYS_CLK) begin
        if (pb_c_out == 1) begin
            set_c <= 1;
        end else if (pb_r_out == 1) begin
            set_c <= 0;
        end
    end
    
    wire [15:0] morse_code_oled_data;
    wire [9:0] morse_code_led_data;
    morse_code_top morse0 (BASYS_CLK, cX, cY, clk_20khz_out, pb_c_out, mic_in, seg, 0, 0, morse_code_led_data);


    assign oled_data = (set_c == 0) ? mainmenu_oled_data : (
                        (state == 0) ? subtask42_oled_data : (
                        (state == 3) ? 16'b11111_111111_11111 : 0 ));
    assign led_out = (set_c == 0) ? 0 : (
                    (state == 0) ? subtask42_led_data : (
                    (state == 3) ? morse_code_led_data : 0 ));


endmodule