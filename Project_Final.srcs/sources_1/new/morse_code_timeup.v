`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 07:16:12
// Design Name: 
// Module Name: morse_code_timeup
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


module morse_code_timeup(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data
    );

    parameter [15:0] red = 16'b11111_00000000000;

    always @(posedge clk) begin
        if ((x ==  33 && y ==   6 ) || (x ==  34 && y ==  6 ) || (x ==  35 && y ==  6 ) || (x ==  36 && y ==  6 ) || (x ==  37 && y ==  6 ) || (x ==  38 && y ==  6 ) || (x ==  39 && y ==  6 ) || (x ==  40 && y ==  6 ) || (x ==  41 && y ==  6 ) || (x ==  42 && y ==  6 ) || (x ==  43 && y ==  6 ) || (x ==  44 && y ==  6 ) || (x ==  45 && y ==  6 ) || (x ==  46 && y ==  6 ) || (x ==  47 && y ==  6 ) || (x ==  48 && y ==  6 ) || (x ==  49 && y ==  6 ) || (x ==  50 && y ==  6 ) || (x ==  51 && y ==  6 ) || (x ==  52 && y ==  6 ) || (x ==  53 && y ==  6 ) || (x ==  54 && y ==  6 ) || (x ==  55 && y ==  6 ) || (x ==  56 && y ==  6 ) || (x ==  57 && y ==  6 ) || (x ==  58 && y ==  6 ) || (x ==  59 && y ==  6 ) || (x ==  60 && y ==  6 ) || (x ==  61 && y ==  6 ) || (x ==  62 && y ==  6 ) || (x ==  33 && y ==  7 ) || (x ==  62 && y ==  7 ) || (x ==  33 && y ==  8 ) || (x ==  62 && y ==  8 ) || (x ==  33 && y ==  9 ) || (x ==  37 && y ==  9 ) || (x ==  38 && y ==  9 ) || (x ==  39 && y ==  9 ) || (x ==  40 && y ==  9 ) || (x ==  41 && y ==  9 ) || (x ==  42 && y ==  9 ) || (x ==  43 && y ==  9 ) || (x ==  44 && y ==  9 ) || (x ==  45 && y ==  9 ) || (x ==  46 && y ==  9 ) || (x ==  47 && y ==  9 ) || (x ==  48 && y ==  9 ) || (x ==  49 && y ==  9 ) || (x ==  50 && y ==  9 ) || (x ==  51 && y ==  9 ) || (x ==  52 && y ==  9 ) || (x ==  53 && y ==  9 ) || (x ==  54 && y ==  9 ) || (x ==  55 && y ==  9 ) || (x ==  56 && y ==  9 ) || (x ==  57 && y ==  9 ) || (x ==  58 && y ==  9 ) || (x ==  62 && y ==  9 ) || (x ==  33 && y ==  10 ) || (x ==  37 && y ==  10 ) || (x ==  38 && y ==  10 ) || (x ==  39 && y ==  10 ) || (x ==  40 && y ==  10 ) || (x ==  41 && y ==  10 ) || (x ==  42 && y ==  10 ) || (x ==  43 && y ==  10 ) || (x ==  44 && y ==  10 ) || (x ==  45 && y ==  10 ) || (x ==  46 && y ==  10 ) || (x ==  47 && y ==  10 ) || (x ==  48 && y ==  10 ) || (x ==  49 && y ==  10 ) || (x ==  50 && y ==  10 ) || (x ==  51 && y ==  10 ) || (x ==  52 && y ==  10 ) || (x ==  53 && y ==  10 ) || (x ==  54 && y ==  10 ) || (x ==  55 && y ==  10 ) || (x ==  56 && y ==  10 ) || (x ==  57 && y ==  10 ) || (x ==  58 && y ==  10 ) || (x ==  62 && y ==  10 ) || (x ==  33 && y ==  11 ) || (x ==  37 && y ==  11 ) || (x ==  38 && y ==  11 ) || (x ==  39 && y ==  11 ) || (x ==  40 && y ==  11 ) || (x ==  41 && y ==  11 ) || (x ==  42 && y ==  11 ) || (x ==  43 && y ==  11 ) || (x ==  44 && y ==  11 ) || (x ==  45 && y ==  11 ) || (x ==  46 && y ==  11 ) || (x ==  47 && y ==  11 ) || (x ==  48 && y ==  11 ) || (x ==  49 && y ==  11 ) || (x ==  50 && y ==  11 ) || (x ==  51 && y ==  11 ) || (x ==  52 && y ==  11 ) || (x ==  53 && y ==  11 ) || (x ==  54 && y ==  11 ) || (x ==  55 && y ==  11 ) || (x ==  56 && y ==  11 ) || (x ==  57 && y ==  11 ) || (x ==  58 && y ==  11 ) || (x ==  62 && y ==  11 ) || (x ==  33 && y ==  12 ) || (x ==  37 && y ==  12 ) || (x ==  38 && y ==  12 ) || (x ==  56 && y ==  12 ) || (x ==  57 && y ==  12 ) || (x ==  62 && y ==  12 ) || (x ==  33 && y ==  13 ) || (x ==  38 && y ==  13 ) || (x ==  56 && y ==  13 ) || (x ==  62 && y ==  13 ) || (x ==  33 && y ==  14 ) || (x ==  38 && y ==  14 ) || (x ==  39 && y ==  14 ) || (x ==  55 && y ==  14 ) || (x ==  56 && y ==  14 ) || (x ==  62 && y ==  14 ) || (x ==  33 && y ==  15 ) || (x ==  39 && y ==  15 ) || (x ==  55 && y ==  15 ) || (x ==  62 && y ==  15 ) || (x ==  33 && y ==  16 ) || (x ==  39 && y ==  16 ) || (x ==  54 && y ==  16 ) || (x ==  62 && y ==  16 ) || (x ==  33 && y ==  17 ) || (x ==  40 && y ==  17 ) || (x ==  53 && y ==  17 ) || (x ==  54 && y ==  17 ) || (x ==  62 && y ==  17 ) || (x ==  33 && y ==  18 ) || (x ==  41 && y ==  18 ) || (x ==  53 && y ==  18 ) || (x ==  62 && y ==  18 ) || (x ==  33 && y ==  19 ) || (x ==  42 && y ==  19 ) || (x ==  52 && y ==  19 ) || (x ==  62 && y ==  19 ) || (x ==  33 && y ==  20 ) || (x ==  42 && y ==  20 ) || (x ==  43 && y ==  20 ) || (x ==  51 && y ==  20 ) || (x ==  62 && y ==  20 ) || (x ==  33 && y ==  21 ) || (x ==  43 && y ==  21 ) || (x ==  51 && y ==  21 ) || (x ==  62 && y ==  21 ) || (x ==  33 && y ==  22 ) || (x ==  44 && y ==  22 ) || (x ==  50 && y ==  22 ) || (x ==  51 && y ==  22 ) || (x ==  62 && y ==  22 ) || (x ==  33 && y ==  23 ) || (x ==  44 && y ==  23 ) || (x ==  45 && y ==  23 ) || (x ==  49 && y ==  23 ) || (x ==  50 && y ==  23 ) || (x ==  62 && y ==  23 ) || (x ==  33 && y ==  24 ) || (x ==  45 && y ==  24 ) || (x ==  48 && y ==  24 ) || (x ==  49 && y ==  24 ) || (x ==  62 && y ==  24 ) || (x ==  33 && y ==  25 ) || (x ==  46 && y ==  25 ) || (x ==  48 && y ==  25 ) || (x ==  62 && y ==  25 ) || (x ==  33 && y ==  26 ) || (x ==  47 && y ==  26 ) || (x ==  62 && y ==  26 ) || (x ==  33 && y ==  27 ) || (x ==  47 && y ==  27 ) || (x ==  62 && y ==  27 ) || (x ==  33 && y ==  28 ) || (x ==  47 && y ==  28 ) || (x ==  62 && y ==  28 ) || (x ==  33 && y ==  29 ) || (x ==  46 && y ==  29 ) || (x ==  48 && y ==  29 ) || (x ==  62 && y ==  29 ) || (x ==  33 && y ==  30 ) || (x ==  45 && y ==  30 ) || (x ==  46 && y ==  30 ) || (x ==  49 && y ==  30 ) || (x ==  62 && y ==  30 ) || (x ==  33 && y ==  31 ) || (x ==  44 && y ==  31 ) || (x ==  45 && y ==  31 ) || (x ==  47 && y ==  31 ) || (x ==  49 && y ==  31 ) || (x ==  50 && y ==  31 ) || (x ==  62 && y ==  31 ) || (x ==  33 && y ==  32 ) || (x ==  44 && y ==  32 ) || (x ==  50 && y ==  32 ) || (x ==  62 && y ==  32 ) || (x ==  33 && y ==  33 ) || (x ==  43 && y ==  33 ) || (x ==  46 && y ==  33 ) || (x ==  48 && y ==  33 ) || (x ==  51 && y ==  33 ) || (x ==  62 && y ==  33 ) || (x ==  33 && y ==  34 ) || (x ==  43 && y ==  34 ) || (x ==  52 && y ==  34 ) || (x ==  62 && y ==  34 ) || (x ==  33 && y ==  35 ) || (x ==  42 && y ==  35 ) || (x ==  47 && y ==  35 ) || (x ==  52 && y ==  35 ) || (x ==  53 && y ==  35 ) || (x ==  62 && y ==  35 ) || (x ==  33 && y ==  36 ) || (x ==  41 && y ==  36 ) || (x ==  42 && y ==  36 ) || (x ==  45 && y ==  36 ) || (x ==  49 && y ==  36 ) || (x ==  52 && y ==  36 ) || (x ==  54 && y ==  36 ) || (x ==  62 && y ==  36 ) || (x ==  33 && y ==  37 ) || (x ==  40 && y ==  37 ) || (x ==  46 && y ==  37 ) || (x ==  51 && y ==  37 ) || (x ==  54 && y ==  37 ) || (x ==  62 && y ==  37 ) || (x ==  33 && y ==  38 ) || (x ==  40 && y ==  38 ) || (x ==  43 && y ==  38 ) || (x ==  48 && y ==  38 ) || (x ==  54 && y ==  38 ) || (x ==  55 && y ==  38 ) || (x ==  62 && y ==  38 ) || (x ==  33 && y ==  39 ) || (x ==  39 && y ==  39 ) || (x ==  40 && y ==  39 ) || (x ==  42 && y ==  39 ) || (x ==  45 && y ==  39 ) || (x ==  49 && y ==  39 ) || (x ==  52 && y ==  39 ) || (x ==  56 && y ==  39 ) || (x ==  62 && y ==  39 ) || (x ==  33 && y ==  40 ) || (x ==  38 && y ==  40 ) || (x ==  39 && y ==  40 ) || (x ==  43 && y ==  40 ) || (x ==  47 && y ==  40 ) || (x ==  54 && y ==  40 ) || (x ==  57 && y ==  40 ) || (x ==  62 && y ==  40 ) || (x ==  33 && y ==  41 ) || (x ==  37 && y ==  41 ) || (x ==  38 && y ==  41 ) || (x ==  41 && y ==  41 ) || (x ==  45 && y ==  41 ) || (x ==  50 && y ==  41 ) || (x ==  52 && y ==  41 ) || (x ==  56 && y ==  41 ) || (x ==  57 && y ==  41 ) || (x ==  62 && y ==  41 ) || (x ==  33 && y ==  42 ) || (x ==  37 && y ==  42 ) || (x ==  38 && y ==  42 ) || (x ==  39 && y ==  42 ) || (x ==  40 && y ==  42 ) || (x ==  41 && y ==  42 ) || (x ==  42 && y ==  42 ) || (x ==  43 && y ==  42 ) || (x ==  44 && y ==  42 ) || (x ==  45 && y ==  42 ) || (x ==  46 && y ==  42 ) || (x ==  47 && y ==  42 ) || (x ==  48 && y ==  42 ) || (x ==  49 && y ==  42 ) || (x ==  50 && y ==  42 ) || (x ==  51 && y ==  42 ) || (x ==  52 && y ==  42 ) || (x ==  53 && y ==  42 ) || (x ==  54 && y ==  42 ) || (x ==  55 && y ==  42 ) || (x ==  56 && y ==  42 ) || (x ==  57 && y ==  42 ) || (x ==  58 && y ==  42 ) || (x ==  62 && y ==  42 ) || (x ==  33 && y ==  43 ) || (x ==  37 && y ==  43 ) || (x ==  38 && y ==  43 ) || (x ==  39 && y ==  43 ) || (x ==  40 && y ==  43 ) || (x ==  41 && y ==  43 ) || (x ==  42 && y ==  43 ) || (x ==  43 && y ==  43 ) || (x ==  44 && y ==  43 ) || (x ==  45 && y ==  43 ) || (x ==  46 && y ==  43 ) || (x ==  47 && y ==  43 ) || (x ==  48 && y ==  43 ) || (x ==  49 && y ==  43 ) || (x ==  50 && y ==  43 ) || (x ==  51 && y ==  43 ) || (x ==  52 && y ==  43 ) || (x ==  53 && y ==  43 ) || (x ==  54 && y ==  43 ) || (x ==  55 && y ==  43 ) || (x ==  56 && y ==  43 ) || (x ==  57 && y ==  43 ) || (x ==  58 && y ==  43 ) || (x ==  62 && y ==  43 ) || (x ==  33 && y ==  44 ) || (x ==  37 && y ==  44 ) || (x ==  38 && y ==  44 ) || (x ==  39 && y ==  44 ) || (x ==  40 && y ==  44 ) || (x ==  41 && y ==  44 ) || (x ==  42 && y ==  44 ) || (x ==  43 && y ==  44 ) || (x ==  44 && y ==  44 ) || (x ==  45 && y ==  44 ) || (x ==  46 && y ==  44 ) || (x ==  47 && y ==  44 ) || (x ==  48 && y ==  44 ) || (x ==  49 && y ==  44 ) || (x ==  50 && y ==  44 ) || (x ==  51 && y ==  44 ) || (x ==  52 && y ==  44 ) || (x ==  53 && y ==  44 ) || (x ==  54 && y ==  44 ) || (x ==  55 && y ==  44 ) || (x ==  56 && y ==  44 ) || (x ==  57 && y ==  44 ) || (x ==  58 && y ==  44 ) || (x ==  62 && y ==  44 ) || (x ==  33 && y ==  45 ) || (x ==  62 && y ==  45 ) || (x ==  33 && y ==  46 ) || (x ==  62 && y ==  46 ) || (x ==  33 && y ==  47 ) || (x ==  62 && y ==  47 ) || (x ==  33 && y ==  48 ) || (x ==  34 && y ==  48 ) || (x ==  35 && y ==  48 ) || (x ==  36 && y ==  48 ) || (x ==  37 && y ==  48 ) || (x ==  38 && y ==  48 ) || (x ==  39 && y ==  48 ) || (x ==  40 && y ==  48 ) || (x ==  41 && y ==  48 ) || (x ==  42 && y ==  48 ) || (x ==  43 && y ==  48 ) || (x ==  44 && y ==  48 ) || (x ==  45 && y ==  48 ) || (x ==  46 && y ==  48 ) || (x ==  47 && y ==  48 ) || (x ==  48 && y ==  48 ) || (x ==  49 && y ==  48 ) || (x ==  50 && y ==  48 ) || (x ==  51 && y ==  48 ) || (x ==  52 && y ==  48 ) || (x ==  53 && y ==  48 ) || (x ==  54 && y ==  48 ) || (x ==  55 && y ==  48 ) || (x ==  56 && y ==  48 ) || (x ==  57 && y ==  48 ) || (x ==  58 && y ==  48 ) || (x ==  59 && y ==  48 ) || (x ==  60 && y ==  48 ) || (x ==  61 && y ==  48 ) || (x ==  62 && y ==  48 ) || (x ==  26 && y ==  52 ) || (x ==  27 && y ==  52 ) || (x ==  28 && y ==  52 ) || (x ==  29 && y ==  52 ) || (x ==  30 && y ==  52 ) || (x ==  32 && y ==  52 ) || (x ==  33 && y ==  52 ) || (x ==  34 && y ==  52 ) || (x ==  36 && y ==  52 ) || (x ==  40 && y ==  52 ) || (x ==  42 && y ==  52 ) || (x ==  43 && y ==  52 ) || (x ==  44 && y ==  52 ) || (x ==  45 && y ==  52 ) || (x ==  48 && y ==  52 ) || (x ==  52 && y ==  52 ) || (x ==  53 && y ==  52 ) || (x ==  54 && y ==  52 ) || (x ==  58 && y ==  52 ) || (x ==  61 && y ==  52 ) || (x ==  63 && y ==  52 ) || (x ==  64 && y ==  52 ) || (x ==  65 && y ==  52 ) || (x ==  69 && y ==  52 ) || (x ==  28 && y ==  53 ) || (x ==  33 && y ==  53 ) || (x ==  36 && y ==  53 ) || (x ==  37 && y ==  53 ) || (x ==  39 && y ==  53 ) || (x ==  40 && y ==  53 ) || (x ==  42 && y ==  53 ) || (x ==  48 && y ==  53 ) || (x ==  51 && y ==  53 ) || (x ==  58 && y ==  53 ) || (x ==  61 && y ==  53 ) || (x ==  63 && y ==  53 ) || (x ==  66 && y ==  53 ) || (x ==  69 && y ==  53 ) || (x ==  28 && y ==  54 ) || (x ==  33 && y ==  54 ) || (x ==  36 && y ==  54 ) || (x ==  38 && y ==  54 ) || (x ==  40 && y ==  54 ) || (x ==  42 && y ==  54 ) || (x ==  43 && y ==  54 ) || (x ==  44 && y ==  54 ) || (x ==  52 && y ==  54 ) || (x ==  53 && y ==  54 ) || (x ==  58 && y ==  54 ) || (x ==  61 && y ==  54 ) || (x ==  63 && y ==  54 ) || (x ==  64 && y ==  54 ) || (x ==  65 && y ==  54 ) || (x ==  69 && y ==  54 ) || (x ==  28 && y ==  55 ) || (x ==  33 && y ==  55 ) || (x ==  36 && y ==  55 ) || (x ==  40 && y ==  55 ) || (x ==  42 && y ==  55 ) || (x ==  54 && y ==  55 ) || (x ==  58 && y ==  55 ) || (x ==  61 && y ==  55 ) || (x ==  63 && y ==  55 ) || (x ==  28 && y ==  56 ) || (x ==  32 && y ==  56 ) || (x ==  33 && y ==  56 ) || (x ==  34 && y ==  56 ) || (x ==  36 && y ==  56 ) || (x ==  40 && y ==  56 ) || (x ==  42 && y ==  56 ) || (x ==  43 && y ==  56 ) || (x ==  44 && y ==  56 ) || (x ==  45 && y ==  56 ) || (x ==  51 && y ==  56 ) || (x ==  52 && y ==  56 ) || (x ==  53 && y ==  56 ) || (x ==  59 && y ==  56 ) || (x ==  60 && y ==  56 ) || (x ==  63 && y ==  56 ) || (x ==  69 && y ==  56 )) oled_data <= red;
        
        else oled_data <= 0;
    end


endmodule
