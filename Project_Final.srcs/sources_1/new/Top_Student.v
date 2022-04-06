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
//  STUDENT B NAME: Amit Rahman 
//  STUDENT B MATRICULATION NUMBER: A0244348B 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input BASYS_CLK,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [15:0] led_out,
    input pb_u, pb_d, pb_c, pb_r, pb_l,
    input [15:0] sw,
    output [6:0] JX,
    output [3:0] an, 
    output [6:0] seg,
    output dp
    );
    assign dp = 1;
    
    /* Mic Configuration */
    // mic_in -> data coming in
    wire clk_20khz_out;
    wire [11:0] mic_in;
    flexible_clk clk_20kHz (BASYS_CLK, 20000, clk_20khz_out);
    Audio_Capture aud0 (.CLK(BASYS_CLK), .cs(clk_20khz_out), .MISO(J_MIC3_Pin3), 
                        .clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_in));
    
    /* Oled Configuration */
    wire [15:0] oled_data;
    wire clk_6_25Mhz_out;
    flexible_clk clk6p25m (BASYS_CLK, 6250000, clk_6_25Mhz_out);
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display display0 (.clk(clk_6_25Mhz_out), .reset(0), .pixel_data(oled_data), 
                .frame_begin(frame_begin), .pixel_index(pixel_index), .sending_pixels(sending_pixels), .sample_pixel(sample_pixel), 
                .cs(JX[0]), .sdin(JX[1]), .sclk(JX[2]), .d_cn(JX[3]), .resn(JX[4]), .vccen(JX[5]), .pmoden(JX[6]), .teststate());

    wire pb_c_out, pb_r_out, pb_d_out, pb_l_out, pb_u_out;
    detect_input detect_input_c (pb_c, BASYS_CLK, pb_c_out);
     detect_input detect_input_r (pb_r, BASYS_CLK, pb_r_out);
     detect_input detect_input_d (pb_d, BASYS_CLK, pb_d_out);
     detect_input detect_input_l (pb_l, BASYS_CLK, pb_l_out);
     detect_input detect_input_u (pb_u, BASYS_CLK, pb_u_out);

    wire [6:0] cX,cY;
    PItoXY convert0 (pixel_index, cX, cY);
  
    reg set_c = 0; 

    /* menu button */
    // state 0 -> Subtask 4.2
    // state 1 -> Audio Spectogram
    // state 2 -> Polynomial Plotter
    // state 3 -> M-O-R-S-E code !
    wire [1:0] state; 
    wire [15:0] mainmenu_oled_data;
    menu_button menu_button0 (pb_u, pb_d, BASYS_CLK, state, set_c);
    menu_display menu0 (state, BASYS_CLK, clk_6_25Mhz_out, cX, cY, mainmenu_oled_data);

    
    /* Subtask 4.2 */
    wire [15:0] subtask42_oled_data;
    wire [4:0] subtask42_led_data;
    wire [6:0] subtask42_seg_data;
    wire [3:0] subtask42_an_data;
    subtask4_2 subtask4_20 (cX, cY, clk_6_25Mhz_out, clk_20khz_out, sw[13], sw[15], sw[14], mic_in, subtask42_seg_data, subtask42_an_data, subtask42_oled_data, subtask42_led_data);
    
    /* Audio Spectrogram */
    wire [11:0] spectrogram_led_data;
    wire [15:0] spectrogram_oled_data;
    wire [3:0] spectrogram_an_data;
    wire [6:0] spectrogram_seg_data;
    spectrogram_top spectrogram_top0(BASYS_CLK, sw[11:0], pixel_index, mic_in, spectrogram_led_data, spectrogram_oled_data, spectrogram_an_data, spectrogram_seg_data);

    /* Polynomial Plotter */
    wire [15:0] poly_led_data;
    wire [15:0] poly_oled_data;
    wire [6:0] poly_seg_data;
    wire [3:0] poly_an_data;

    poly_top poly_top1 (BASYS_CLK, pb_c, sw[9:0], sw[12:10], sw[15], pixel_index, poly_led_data, poly_seg_data, poly_an_data, poly_oled_data, state, set_c);


    /* M-O-R-S-E CODE ! */
    wire [15:0] morse_code_oled_data;
    wire [15:0] morse_code_led_data;
    wire [6:0] morse_code_seg_data;
    wire [3:0] morse_code_an_data;
    morse_code_top morse0 (BASYS_CLK, pixel_index, clk_20khz_out, clk_6_25Mhz_out, pb_c_out, mic_in, sw[1:0], morse_code_seg_data, morse_code_oled_data, morse_code_an_data, morse_code_led_data);


     always @(posedge BASYS_CLK) begin
         if (pb_l_out == 1) begin
             set_c <= 1;
         end else if (pb_r_out == 1) begin
             set_c <= 0;
         end
     end

    assign oled_data = (set_c == 0) ? mainmenu_oled_data : (
                        (state == 0) ? subtask42_oled_data : (
                        (state == 1) ? spectrogram_oled_data : (
                        (state == 2) ? poly_oled_data : (
                        (state == 3) ? morse_code_oled_data : 0))));

    assign led_out = (set_c == 0) ? 0 : (
                    (state == 0) ? subtask42_led_data : (
                    (state == 1) ? spectrogram_led_data : (
                    (state == 2) ? poly_led_data : (
                    (state == 3) ? morse_code_led_data : 0))));

    assign an = (set_c == 0) ? 4'b1111 : (
                (state == 0) ? 4'b1111 : (
                (state == 1) ? spectrogram_an_data : (
                (state == 2) ? poly_an_data : (
                (state == 3) ? 4'b1111 : 4'b1111))));

    assign seg = (set_c == 0) ? 7'b1111111 : (
                (state == 0) ? 7'b1111111 : (
                (state == 1) ? spectrogram_seg_data : (
                (state == 2) ? poly_seg_data : (
                (state == 3) ? 7'b1111111 : 7'b1111111))));
endmodule