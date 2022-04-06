`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 08:10:35
// Design Name: 
// Module Name: spectrogram
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


module spectrogram(
    input clock_20kHz,
    inout CLOCK,
    input paused,
    input [11:0] mic_in,
    input [12:0] pixel_index,
//    output reg [15:0] oled_data
//    output reg [13:0] frequency_out,
//    output reg debug=0,
    output [15:0] oled_out
    );
    
    reg [14:0] counter;
    reg [5:0] sig0, sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8, sig9, sig10, sig11, sig12, sig13, sig14, sig15, sig16, sig17, sig18, sig19, sig20, sig21, sig22, sig23, sig24, sig25, sig26, sig27, sig28, sig29, sig30, sig31, sig32, sig33, sig34, sig35, sig36, sig37, sig38, sig39, sig40, sig41, sig42, sig43, sig44, sig45, sig46, sig47, sig48, sig49, sig50, sig51, sig52, sig53, sig54, sig55, sig56, sig57, sig58, sig59, sig60, sig61, sig62, sig63, sig64, sig65, sig66, sig67, sig68, sig69, sig70, sig71, sig72, sig73, sig74, sig75, sig76, sig77, sig78, sig79, sig80, sig81, sig82, sig83, sig84, sig85, sig86, sig87, sig88, sig89, sig90, sig91, sig92, sig93, sig94, sig95;
    reg [5:0] del0, del1, del2, del3, del4, del5, del6, del7, del8, del9, del10, del11, del12, del13, del14, del15, del16, del17, del18, del19, del20, del21, del22, del23, del24, del25, del26, del27, del28, del29, del30, del31, del32, del33, del34, del35, del36, del37, del38, del39, del40, del41, del42, del43, del44, del45, del46, del47, del48, del49, del50, del51, del52, del53, del54, del55, del56, del57, del58, del59, del60, del61, del62, del63, del64, del65, del66, del67, del68, del69, del70, del71, del72, del73, del74, del75, del76, del77, del78, del79, del80, del81, del82, del83, del84, del85, del86, del87, del88, del89, del90, del91, del92, del93, del94, del95;
    
    reg [6:0] x; 
    reg [5:0] y;
    
    reg [15:0] plot_point = 16'b11111_111111_11111, background_color = 16'b00011_0000011_00011, axes_colour = 16'b00110_011111_11111;
    
    // pasue mechanism
    reg [15:0] oled_data;
//    wire [15:0] oled_out;
    reg [15:0] oled_paused;
//    assign oled_out = (paused)? oled_paused : oled_data;
     assign oled_out = oled_data;

    
    
    // plot wave
    always @ (posedge CLOCK) begin       
//        if(!paused)begin

        x = pixel_index % 96;
        y = pixel_index / 96;
        oled_data = background_color;
        if (x == 47 || y == 31) oled_data = axes_colour; // axes

//         1 px width line
        if (x == 0 && y == del0 ) oled_data = plot_point;
        if (x == 1 && (y == del1 )) oled_data = plot_point;
        if (x == 2 && (y == del2 )) oled_data = plot_point;
        if (x == 3 && (y == del3 )) oled_data = plot_point;
        if (x == 4 && (y == del4 )) oled_data = plot_point;
        if (x == 5 && (y == del5 )) oled_data = plot_point;
        if (x == 6 && (y == del6 )) oled_data = plot_point;
        if (x == 7 && (y == del7 )) oled_data = plot_point;
        if (x == 8 && (y == del8 )) oled_data = plot_point;
        if (x == 9 && (y == del9 )) oled_data = plot_point;
        if (x == 10 && (y == del10 )) oled_data = plot_point;
        if (x == 11 && (y == del11 )) oled_data = plot_point;
        if (x == 12 && (y == del12 )) oled_data = plot_point;
        if (x == 13 && (y == del13 )) oled_data = plot_point;
        if (x == 14 && (y == del14 )) oled_data = plot_point;
        if (x == 15 && (y == del15 )) oled_data = plot_point;
        if (x == 16 && (y == del16 )) oled_data = plot_point;
        if (x == 17 && (y == del17 )) oled_data = plot_point;
        if (x == 18 && (y == del18 )) oled_data = plot_point;
        if (x == 19 && (y == del19 )) oled_data = plot_point;
        if (x == 20 && (y == del20 )) oled_data = plot_point;
        if (x == 21 && (y == del21 )) oled_data = plot_point;
        if (x == 22 && (y == del22 )) oled_data = plot_point;
        if (x == 23 && (y == del23 )) oled_data = plot_point;
        if (x == 24 && (y == del24 )) oled_data = plot_point;
        if (x == 25 && (y == del25 )) oled_data = plot_point;
        if (x == 26 && (y == del26 )) oled_data = plot_point;
        if (x == 27 && (y == del27 )) oled_data = plot_point;
        if (x == 28 && (y == del28 )) oled_data = plot_point;
        if (x == 29 && (y == del29 )) oled_data = plot_point;
        if (x == 30 && (y == del30 )) oled_data = plot_point;
        if (x == 31 && (y == del31 )) oled_data = plot_point;
        if (x == 32 && (y == del32 )) oled_data = plot_point;
        if (x == 33 && (y == del33 )) oled_data = plot_point;
        if (x == 34 && (y == del34 )) oled_data = plot_point;
        if (x == 35 && (y == del35 )) oled_data = plot_point;
        if (x == 36 && (y == del36 )) oled_data = plot_point;
        if (x == 37 && (y == del37 )) oled_data = plot_point;
        if (x == 38 && (y == del38 )) oled_data = plot_point;
        if (x == 39 && (y == del39 )) oled_data = plot_point;
        if (x == 40 && (y == del40 )) oled_data = plot_point;
        if (x == 41 && (y == del41 )) oled_data = plot_point;
        if (x == 42 && (y == del42 )) oled_data = plot_point;
        if (x == 43 && (y == del43 )) oled_data = plot_point;
        if (x == 44 && (y == del44 )) oled_data = plot_point;
        if (x == 45 && (y == del45 )) oled_data = plot_point;
        if (x == 46 && (y == del46 )) oled_data = plot_point;
        if (x == 47 && (y == del47 )) oled_data = plot_point;
        if (x == 48 && (y == del48 )) oled_data = plot_point;
        if (x == 49 && (y == del49 )) oled_data = plot_point;
        if (x == 50 && (y == del50 )) oled_data = plot_point;
        if (x == 51 && (y == del51 )) oled_data = plot_point;
        if (x == 52 && (y == del52 )) oled_data = plot_point;
        if (x == 53 && (y == del53 )) oled_data = plot_point;
        if (x == 54 && (y == del54 )) oled_data = plot_point;
        if (x == 55 && (y == del55 )) oled_data = plot_point;
        if (x == 56 && (y == del56 )) oled_data = plot_point;
        if (x == 57 && (y == del57 )) oled_data = plot_point;
        if (x == 58 && (y == del58 )) oled_data = plot_point;
        if (x == 59 && (y == del59 )) oled_data = plot_point;
        if (x == 60 && (y == del60 )) oled_data = plot_point;
        if (x == 61 && (y == del61 )) oled_data = plot_point;
        if (x == 62 && (y == del62 )) oled_data = plot_point;
        if (x == 63 && (y == del63 )) oled_data = plot_point;
        if (x == 64 && (y == del64 )) oled_data = plot_point;
        if (x == 65 && (y == del65 )) oled_data = plot_point;
        if (x == 66 && (y == del66 )) oled_data = plot_point;
        if (x == 67 && (y == del67 )) oled_data = plot_point;
        if (x == 68 && (y == del68 )) oled_data = plot_point;
        if (x == 69 && (y == del69 )) oled_data = plot_point;
        if (x == 70 && (y == del70 )) oled_data = plot_point;
        if (x == 71 && (y == del71 )) oled_data = plot_point;
        if (x == 72 && (y == del72 )) oled_data = plot_point;
        if (x == 73 && (y == del73 )) oled_data = plot_point;
        if (x == 74 && (y == del74 )) oled_data = plot_point;
        if (x == 75 && (y == del75 )) oled_data = plot_point;
        if (x == 76 && (y == del76 )) oled_data = plot_point;
        if (x == 77 && (y == del77 )) oled_data = plot_point;
        if (x == 78 && (y == del78 )) oled_data = plot_point;
        if (x == 79 && (y == del79 )) oled_data = plot_point;
        if (x == 80 && (y == del80 )) oled_data = plot_point;
        if (x == 81 && (y == del81 )) oled_data = plot_point;
        if (x == 82 && (y == del82 )) oled_data = plot_point;
        if (x == 83 && (y == del83 )) oled_data = plot_point;
        if (x == 84 && (y == del84 )) oled_data = plot_point;
        if (x == 85 && (y == del85 )) oled_data = plot_point;
        if (x == 86 && (y == del86 )) oled_data = plot_point;
        if (x == 87 && (y == del87 )) oled_data = plot_point;
        if (x == 88 && (y == del88 )) oled_data = plot_point;
        if (x == 89 && (y == del89 )) oled_data = plot_point;
        if (x == 90 && (y == del90 )) oled_data = plot_point;
        if (x == 91 && (y == del91 )) oled_data = plot_point;
        if (x == 92 && (y == del92 )) oled_data = plot_point;
        if (x == 93 && (y == del93 )) oled_data = plot_point;
        if (x == 94 && (y == del94 )) oled_data = plot_point;
        if (x == 95 && (y == del95 )) oled_data = plot_point;
//        end
//        else begin
//            oled_paused <= oled_data;
//        end
    end
  /*  
    //finding frequency
    reg [6:0] cx1 = 1;
    reg [6:0] cross = 0;
    reg [6:0] start = 0;
    reg [6:0] stop = 0;
    reg [6:0] period = 0;
//    reg debug = 0;
//    reg
    always @ ( posedge CLOCK) begin
        if (paused && cx1 != 96)
        begin
            if (x == cx1 && (y == 32||y==31||y--30) && cross <3 &&oled_data == plot_point) 
            begin
                debug <=1;
                cross <= cross +1;
                if(cross == 1)start <= cx1;
                if(cross == 2) stop <= cx1;
            end
            cx1 <= cx1 + 1;
        end 
        
        
        if (cross > 2)
        begin
            period <= 2*(stop - start);
            frequency_out <= 20000/period;
        end
    end */
    
    always @ (posedge clock_20kHz) begin
        if(!paused)begin
        case (counter)
            0: begin 
                sig0 <= mic_in[11:6];
                del0 <= sig0;
            end
            1: sig1 <= mic_in[11:6];
            2: sig2 <= mic_in[11:6];
            3: sig3 <= mic_in[11:6];
            4: sig4 <= mic_in[11:6];
            5: sig5 <= mic_in[11:6];
            6: sig6 <= mic_in[11:6];
            7: sig7 <= mic_in[11:6];
            8: sig8 <= mic_in[11:6];
            9: sig9 <= mic_in[11:6];
            10: sig10 <= mic_in[11:6];
            11: sig11 <= mic_in[11:6];
            12: sig12 <= mic_in[11:6];
            13: sig13 <= mic_in[11:6];
            14: sig14 <= mic_in[11:6];
            15: sig15 <= mic_in[11:6];
            16: sig16 <= mic_in[11:6];
            17: sig17 <= mic_in[11:6];
            18: sig18 <= mic_in[11:6];
            19: sig19 <= mic_in[11:6];
            20: sig20 <= mic_in[11:6];
            21: sig21 <= mic_in[11:6];
            22: sig22 <= mic_in[11:6];
            23: sig23 <= mic_in[11:6];
            24: sig24 <= mic_in[11:6];
            25: sig25 <= mic_in[11:6];
            26: sig26 <= mic_in[11:6];
            27: sig27 <= mic_in[11:6];
            28: sig28 <= mic_in[11:6];
            29: sig29 <= mic_in[11:6];
            30: sig30 <= mic_in[11:6];
            31: sig31 <= mic_in[11:6];
            32: sig32 <= mic_in[11:6];
            33: sig33 <= mic_in[11:6];
            34: sig34 <= mic_in[11:6];
            35: sig35 <= mic_in[11:6];
            36: sig36 <= mic_in[11:6];
            37: sig37 <= mic_in[11:6];
            38: sig38 <= mic_in[11:6];
            39: sig39 <= mic_in[11:6];
            40: sig40 <= mic_in[11:6];
            41: sig41 <= mic_in[11:6];
            42: sig42 <= mic_in[11:6];
            43: sig43 <= mic_in[11:6];
            44: sig44 <= mic_in[11:6];
            45: sig45 <= mic_in[11:6];
            46: sig46 <= mic_in[11:6];
            47: sig47 <= mic_in[11:6];
            48: sig48 <= mic_in[11:6];
            49: sig49 <= mic_in[11:6];
            50: sig50 <= mic_in[11:6];
            51: sig51 <= mic_in[11:6];
            52: sig52 <= mic_in[11:6];
            53: sig53 <= mic_in[11:6];
            54: sig54 <= mic_in[11:6];
            55: sig55 <= mic_in[11:6];
            56: sig56 <= mic_in[11:6];
            57: sig57 <= mic_in[11:6];
            58: sig58 <= mic_in[11:6];
            59: sig59 <= mic_in[11:6];
            60: sig60 <= mic_in[11:6];
            61: sig61 <= mic_in[11:6];
            62: sig62 <= mic_in[11:6];
            63: sig63 <= mic_in[11:6];
            64: sig64 <= mic_in[11:6];
            65: sig65 <= mic_in[11:6];
            66: sig66 <= mic_in[11:6];
            67: sig67 <= mic_in[11:6];
            68: sig68 <= mic_in[11:6];
            69: sig69 <= mic_in[11:6];
            70: sig70 <= mic_in[11:6];
            71: sig71 <= mic_in[11:6];
            72: sig72 <= mic_in[11:6];
            73: sig73 <= mic_in[11:6];
            74: sig74 <= mic_in[11:6];
            75: sig75 <= mic_in[11:6];
            76: sig76 <= mic_in[11:6];
            77: sig77 <= mic_in[11:6];
            78: sig78 <= mic_in[11:6];
            79: sig79 <= mic_in[11:6];
            80: sig80 <= mic_in[11:6];
            81: sig81 <= mic_in[11:6];
            82: sig82 <= mic_in[11:6];
            83: sig83 <= mic_in[11:6];
            84: sig84 <= mic_in[11:6];
            85: sig85 <= mic_in[11:6];
            86: sig86 <= mic_in[11:6];
            87: sig87 <= mic_in[11:6];
            88: sig88 <= mic_in[11:6];
            89: sig89 <= mic_in[11:6];
            90: sig90 <= mic_in[11:6];
            91: sig91 <= mic_in[11:6];
            92: sig92 <= mic_in[11:6];
            93: sig93 <= mic_in[11:6];
            94: sig94 <= mic_in[11:6];
            95: sig95 <= mic_in[11:6];

            // plotting raw data scaled to fit x axis
            104: del1 <= sig1;
            208: del2 <= sig2;
            312: del3 <= sig3;
            416: del4 <= sig4;
            520: del5 <= sig5;
            624: del6 <= sig6;
            728: del7 <= sig7;
            832: del8 <= sig8;
            936: del9 <= sig9;
            1040: del10 <= sig10;
            1144: del11 <= sig11;
            1248: del12 <= sig12;
            1352: del13 <= sig13;
            1456: del14 <= sig14;
            1560: del15 <= sig15;
            1664: del16 <= sig16;
            1768: del17 <= sig17;
            1872: del18 <= sig18;
            1976: del19 <= sig19;
            2080: del20 <= sig20;
            2184: del21 <= sig21;
            2288: del22 <= sig22;
            2392: del23 <= sig23;
            2496: del24 <= sig24;
            2600: del25 <= sig25;
            2704: del26 <= sig26;
            2808: del27 <= sig27;
            2912: del28 <= sig28;
            3016: del29 <= sig29;
            3120: del30 <= sig30;
            3224: del31 <= sig31;
            3328: del32 <= sig32;
            3432: del33 <= sig33;
            3536: del34 <= sig34;
            3640: del35 <= sig35;
            3744: del36 <= sig36;
            3848: del37 <= sig37;
            3952: del38 <= sig38;
            4056: del39 <= sig39;
            4160: del40 <= sig40;
            4264: del41 <= sig41;
            4368: del42 <= sig42;
            4472: del43 <= sig43;
            4576: del44 <= sig44;
            4680: del45 <= sig45;
            4784: del46 <= sig46;
            4888: del47 <= sig47;
            4992: del48 <= sig48;
            5096: del49 <= sig49;
            5200: del50 <= sig50;
            5304: del51 <= sig51;
            5408: del52 <= sig52;
            5512: del53 <= sig53;
            5616: del54 <= sig54;
            5720: del55 <= sig55;
            5824: del56 <= sig56;
            5928: del57 <= sig57;
            6032: del58 <= sig58;
            6136: del59 <= sig59;
            6240: del60 <= sig60;
            6344: del61 <= sig61;
            6448: del62 <= sig62;
            6552: del63 <= sig63;
            6656: del64 <= sig64;
            6760: del65 <= sig65;
            6864: del66 <= sig66;
            6968: del67 <= sig67;
            7072: del68 <= sig68;
            7176: del69 <= sig69;
            7280: del70 <= sig70;
            7384: del71 <= sig71;
            7488: del72 <= sig72;
            7592: del73 <= sig73;
            7696: del74 <= sig74;
            7800: del75 <= sig75;
            7904: del76 <= sig76;
            8008: del77 <= sig77;
            8112: del78 <= sig78;
            8216: del79 <= sig79;
            8320: del80 <= sig80;
            8424: del81 <= sig81;
            8528: del82 <= sig82;
            8632: del83 <= sig83;
            8736: del84 <= sig84;
            8840: del85 <= sig85;
            8944: del86 <= sig86;
            9048: del87 <= sig87;
            9152: del88 <= sig88;
            9256: del89 <= sig89;
            9360: del90 <= sig90;
            9464: del91 <= sig91;
            9568: del92 <= sig92;
            9672: del93 <= sig93;
            9776: del94 <= sig94;
            9880: del95 <= sig95;
        endcase
    
        counter <= (counter == 10000) ? 0 : counter + 1;
        end
    end
endmodule