`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input BASYS_CLK,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output reg [4:0] led_out = 0,
    input sw,
    input sub_4hide, sub_4, sub_4AorB,
    output [6:0] JX,
    output reg [3:0] an = 4'b1110, 
    output reg [6:0] seg = 7'b1111111,
    output dp
    );
    assign dp = 1;
    wire clk_10hz_out, clk_100hz_out;
    flexible_clk clk_10Hz (BASYS_CLK, 10, clk_10hz_out);
    flexible_clk clk_100kHz (BASYS_CLK, 100, clk_100hz_out);
    
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

    /*I want to store individual frame in a module*/
    /*
        input: pixel_index
        output: oled_data
        
    */
    
    /* ----------- SUBTASK 4.2 ----------- */
    /* 4.2A */
    wire [6:0] cX,cY;
    PItoXY convert0 (pixel_index, cX, cY);
    reg [15:0] oled_data_A = 0;
    always @(posedge clk_6_25Mhz_out) begin
        if (sub_4hide && ((cX >= 1 && cX <= 94 && cY == 1) || 
            (cX == 1 && cY >= 1 && cY <= 62) || 
            (cX == 94 && cY >= 1 && cY <= 62) ||
            (cX >= 1 && cX <= 94 && cY == 62))) begin
            oled_data_A = 16'b0000011111100000; // Green
        end else 
        if (sub_4hide && ((cX >= 3 && cX <= 92 && cY == 3) || 
            (cX == 3 && cY >= 3 && cY <= 60) || 
            (cX == 92 && cY >= 3 && cY <= 60) ||
            (cX >= 3 && cX <= 92 && cY == 60))) begin
            oled_data_A = 16'b11111_111001_00000; // Orange
        end else 
        if (sub_4hide && ((cX >= 5 && cX <= 90 && (cY == 5 || cY == 6 || cY == 7)) || // Change to 3 pixels wide
            ((cX == 5 || cX == 6 || cX == 7) && cY >= 5 && cY <= 58) || 
            ((cX == 90 || cX == 89 || cX == 88) && cY >= 5 && cY <= 58) ||
            (cX >= 5 && cX <= 90 && (cY == 56 || cY == 57 || cY == 58)))) begin
            oled_data_A = 16'b11111_000000_00000; // Red
        end else oled_data_A = 0;
    end     
    /* 4.2B */
    reg [15:0] oled_data_B = 0;
    always @(posedge clk_6_25Mhz_out) begin
        if (cX >= 18 && cX <= 77 && cY >= 13 && cY <= 50) begin
            oled_data_B = 16'b00000_111111_00000; // Green
        end else oled_data_B = 0;

        if (sub_4hide && (cX >= 18 && cX <= 77 && cY >= 20 && cY <= 43)) begin
            oled_data_B = 16'b11111_111001_00000; // Orange
        end 
        
        if (cX >= 18 && cX <= 77 && cY >= 27 && cY <= 36) begin
            oled_data_B = 16'b11111_000000_00000; // Red
        end 
    end
    
    /* 4.2C */
    // mic_in is 12 bits 0 -> 4095
    reg [11:0] current_peak = 0;
    reg [10:0] count_mic = 0;
    reg [2:0] vol_lvl = 0;
    
    // AVI1 Find peak intensity value
    always @(posedge clk_20khz_out) begin
        count_mic <= count_mic + 1;
        if (mic_in > current_peak) begin
            current_peak <= mic_in;
        end
        if (count_mic == 1999) begin
            // LED Update to led_out
//            if (current_peak >= 0 && current_peak < 683) led_out <= 5'b00000;
//            else if (current_peak < 1364) led_out <= 5'b00001;
//            else if (current_peak < 2046) led_out <= 5'b00011;
//            else if (current_peak < 2728) led_out <= 5'b00111;
//            else if (current_peak < 3410) led_out <= 5'b01111;
//            else led_out <= 5'b11111;
            
            /* more fine grained */
            if (current_peak < 2100) vol_lvl <= 0;
            else if (current_peak < 2500) vol_lvl <= 1;
            else if (current_peak < 3000) vol_lvl <= 2;
            else if (current_peak < 3450) vol_lvl <= 3;
            else if (current_peak < 3700) vol_lvl <= 4;
            else vol_lvl <= 5;
            
            current_peak <= 0;
            count_mic <= 0;
        end
    end
    // AVI2A. Map vol_lvl to LD0 to LD4, control LED
    always @ (posedge clk_6_25Mhz_out) begin
        if (!sub_4 && sub_4AorB && sub_4hide) begin
            if (vol_lvl == 0) led_out = 5'b00000;
            if (vol_lvl == 1) led_out = 5'b00001;
            if (vol_lvl == 2) led_out = 5'b00011;
            if (vol_lvl == 3) led_out = 5'b00111;
            if (vol_lvl == 4) led_out = 5'b01111;
            if (vol_lvl == 5) led_out = 5'b11111;    
        end else led_out = 5'b00000;
    end
    
    // AVI2B. Anode display, control Anode
    always @(posedge clk_6_25Mhz_out) begin
        if (!sub_4 && sub_4AorB && sub_4hide) begin
            if (vol_lvl == 0) seg = 7'b1000000;
            if (vol_lvl == 1) seg = 7'b1111001;
            if (vol_lvl == 2) seg = 7'b0100100;
            if (vol_lvl == 3) seg = 7'b0110000;
            if (vol_lvl == 4) seg = 7'b0011001;
            if (vol_lvl == 5) seg = 7'b0010010;
        end else seg = 7'b1111111;
    end
    
    // AVI3
    wire [15:0] oled_data_C;

    reg [15:0] oled_data_CA = 0;
    always @(posedge clk_6_25Mhz_out) begin
        if ((vol_lvl == 1 || vol_lvl == 2 || vol_lvl == 3 || vol_lvl == 4 || vol_lvl == 5) && ((cX >= 1 && cX <= 94 && cY == 1) || 
            (cX == 1 && cY >= 1 && cY <= 62) || 
            (cX == 94 && cY >= 1 && cY <= 62) ||
            (cX >= 1 && cX <= 94 && cY == 62))) begin
            oled_data_CA = 16'b0000011111100000; // Green
        end else 
        if ((vol_lvl == 3 || vol_lvl == 4 || vol_lvl == 5) && ((cX >= 3 && cX <= 92 && cY == 3) || 
            (cX == 3 && cY >= 3 && cY <= 60) || 
            (cX == 92 && cY >= 3 && cY <= 60) ||
            (cX >= 3 && cX <= 92 && cY == 60))) begin
            oled_data_CA = 16'b11111_111001_00000; // Orange
        end else 
        if (vol_lvl == 5 && ((cX >= 5 && cX <= 90 && (cY == 5 || cY == 6 || cY == 7)) || // Change to 3 pixels wide
            ((cX == 5 || cX == 6 || cX == 7) && cY >= 5 && cY <= 58) || 
            ((cX == 90 || cX == 89 || cX == 88) && cY >= 5 && cY <= 58) ||
            (cX >= 5 && cX <= 90 && (cY == 56 || cY == 57 || cY == 58)))) begin
            oled_data_CA = 16'b11111_000000_00000; // Red
        end else oled_data_CA = 0;
    end 
    
    reg [15:0] oled_data_CB = 0;
    always @(posedge clk_6_25Mhz_out) begin
        if ((vol_lvl == 1 || vol_lvl == 2 || vol_lvl == 3 || vol_lvl == 4 || vol_lvl == 5) && cX >= 18 && cX <= 77 && cY >= 13 && cY <= 50) begin
            oled_data_CB = 16'b00000_111111_00000; // Green
        end else oled_data_CB = 0;

        if ((vol_lvl == 3 || vol_lvl == 4 || vol_lvl == 5) && (cX >= 18 && cX <= 77 && cY >= 20 && cY <= 43)) begin
            oled_data_CB = 16'b11111_111001_00000; // Orange
        end 
        
        if (vol_lvl == 5 && (cX >= 18 && cX <= 77 && cY >= 27 && cY <= 36)) begin
            oled_data_CB = 16'b11111_000000_00000; // Red
        end 
    end
    
    assign oled_data_C = oled_data_CA | oled_data_CB;

    assign oled_data = (sub_4) ? (sub_4AorB ? oled_data_B : oled_data_A) : 
    (sub_4AorB && sub_4hide ? oled_data_C : 0);
    /* ----------- SUBTASK 4.2 END----------- */

endmodule