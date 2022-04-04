`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 15:25:37
// Design Name: 
// Module Name: display_bg_moving
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


module display_bg_moving(
    input clk,
    input slow_clk,
    input [7:0] x,y,
    output reg [15:0] oled_data
    );
    parameter [15:0] light_grey = 16'b10011_100011_10011;

    reg [7:0] x_offset = 0, y_offset = 0;
    always @(posedge slow_clk) begin
        if (x_offset != 13 && y_offset != 13) begin
            x_offset <= x_offset + 1;
        end else if (x_offset == 13 && y_offset != 13) begin
            y_offset <= y_offset + 1;
        end else if (x_offset == 13 && y_offset == 13) begin
            x_offset <= 0;
            y_offset <= 0;
        end
    end
    
    
    always @(posedge clk) begin
        if ((x ==  7  + x_offset && y ==  6 + y_offset) || 
            (x ==  7  + x_offset && y ==  7 + y_offset) || 
            (x ==  7  + x_offset && y ==  8 + y_offset) || 
            (x ==  4  + x_offset && y ==  9 + y_offset) || 
            (x ==  5  + x_offset && y ==  9 + y_offset) || 
            (x ==  6  + x_offset && y ==  9 + y_offset) || 
            (x ==  7  + x_offset && y ==  9 + y_offset) || 
            (x ==  8  + x_offset && y ==  9 + y_offset) || 
            (x ==  9  + x_offset && y ==  9 + y_offset) || 
            (x ==  10  + x_offset && y ==  9 + y_offset) || 
            (x ==  59  + x_offset && y ==  9 + y_offset) || 
            (x ==  82  + x_offset && y ==  9 + y_offset) || 
            (x ==  83  + x_offset && y ==  9 + y_offset) || 
            (x ==  84  + x_offset && y ==  9 + y_offset) || 
            (x ==  85  + x_offset && y ==  9 + y_offset) || 
            (x ==  86  + x_offset && y ==  9 + y_offset) || 
            (x ==  87  + x_offset && y ==  9 + y_offset) || 
            (x ==  89  + x_offset && y ==  9 + y_offset) || 
            (x ==  7  + x_offset && y ==  10 + y_offset) || 
            (x ==  59  + x_offset && y ==  10 + y_offset) || 
            (x ==  84  + x_offset && y ==  10 + y_offset) || 
            (x ==  86  + x_offset && y ==  10 + y_offset) || 
            (x ==  87  + x_offset && y ==  10 + y_offset) || 
            (x ==  88  + x_offset && y ==  10 + y_offset) || 
            (x ==  89  + x_offset && y ==  10 + y_offset) || 
            (x ==  7  + x_offset && y ==  11 + y_offset) || 
            (x ==  59  + x_offset && y ==  11 + y_offset) || 
            (x ==  84  + x_offset && y ==  11 + y_offset) || 
            (x ==  86  + x_offset && y ==  11 + y_offset) || 
            (x ==  87  + x_offset && y ==  11 + y_offset) || 
            (x ==  7  + x_offset && y ==  12 + y_offset) || 
            (x ==  59  + x_offset && y ==  12 + y_offset) || 
            (x ==  84  + x_offset && y ==  12 + y_offset) || 
            (x ==  87  + x_offset && y ==  12 + y_offset) || 
            (x ==  58  + x_offset && y ==  13 + y_offset) || 
            (x ==  59  + x_offset && y ==  13 + y_offset) || 
            (x ==  60  + x_offset && y ==  13 + y_offset) || 
            (x ==  61  + x_offset && y ==  13 + y_offset) || 
            (x ==  83  + x_offset && y ==  13 + y_offset) || 
            (x ==  84  + x_offset && y ==  13 + y_offset) || 
            (x ==  87  + x_offset && y ==  13 + y_offset) || 
            (x ==  57  + x_offset && y ==  14 + y_offset) || 
            (x ==  59  + x_offset && y ==  14 + y_offset) || 
            (x ==  62  + x_offset && y ==  14 + y_offset) || 
            (x ==  63  + x_offset && y ==  14 + y_offset) || 
            (x ==  83  + x_offset && y ==  14 + y_offset) || 
            (x ==  87  + x_offset && y ==  14 + y_offset) || 
            (x ==  89  + x_offset && y ==  14 + y_offset) || 
            (x ==  55  + x_offset && y ==  15 + y_offset) || 
            (x ==  56  + x_offset && y ==  15 + y_offset) || 
            (x ==  59  + x_offset && y ==  15 + y_offset) || 
            (x ==  63  + x_offset && y ==  15 + y_offset) || 
            (x ==  64  + x_offset && y ==  15 + y_offset) || 
            (x ==  82  + x_offset && y ==  15 + y_offset) || 
            (x ==  83  + x_offset && y ==  15 + y_offset) || 
            (x ==  87  + x_offset && y ==  15 + y_offset) || 
            (x ==  88  + x_offset && y ==  15 + y_offset) || 
            (x ==  89  + x_offset && y ==  15 + y_offset) || 
            (x ==  13  + x_offset && y ==  16 + y_offset) || 
            (x ==  14  + x_offset && y ==  16 + y_offset) || 
            (x ==  15  + x_offset && y ==  16 + y_offset) || 
            (x ==  16  + x_offset && y ==  16 + y_offset) || 
            (x ==  17  + x_offset && y ==  16 + y_offset) || 
            (x ==  54  + x_offset && y ==  16 + y_offset) || 
            (x ==  55  + x_offset && y ==  16 + y_offset) || 
            (x ==  59  + x_offset && y ==  16 + y_offset) || 
            (x ==  64  + x_offset && y ==  16 + y_offset) || 
            (x ==  12  + x_offset && y ==  17 + y_offset) || 
            (x ==  13  + x_offset && y ==  17 + y_offset) || 
            (x ==  17  + x_offset && y ==  17 + y_offset) || 
            (x ==  18  + x_offset && y ==  17 + y_offset) || 
            (x ==  54  + x_offset && y ==  17 + y_offset) || 
            (x ==  59  + x_offset && y ==  17 + y_offset) || 
            (x ==  65  + x_offset && y ==  17 + y_offset) || 
            (x ==  53  + x_offset && y ==  18 + y_offset) || 
            (x ==  59  + x_offset && y ==  18 + y_offset) || 
            (x ==  66  + x_offset && y ==  18 + y_offset) || 
            (x ==  49  + x_offset && y ==  19 + y_offset) || 
            (x ==  50  + x_offset && y ==  19 + y_offset) || 
            (x ==  51  + x_offset && y ==  19 + y_offset) || 
            (x ==  52  + x_offset && y ==  19 + y_offset) || 
            (x ==  53  + x_offset && y ==  19 + y_offset) || 
            (x ==  54  + x_offset && y ==  19 + y_offset) || 
            (x ==  55  + x_offset && y ==  19 + y_offset) || 
            (x ==  56  + x_offset && y ==  19 + y_offset) || 
            (x ==  57  + x_offset && y ==  19 + y_offset) || 
            (x ==  58  + x_offset && y ==  19 + y_offset) || 
            (x ==  59  + x_offset && y ==  19 + y_offset) || 
            (x ==  60  + x_offset && y ==  19 + y_offset) || 
            (x ==  61  + x_offset && y ==  19 + y_offset) || 
            (x ==  62  + x_offset && y ==  19 + y_offset) || 
            (x ==  63  + x_offset && y ==  19 + y_offset) || 
            (x ==  64  + x_offset && y ==  19 + y_offset) || 
            (x ==  65  + x_offset && y ==  19 + y_offset) || 
            (x ==  66  + x_offset && y ==  19 + y_offset) || 
            (x ==  67  + x_offset && y ==  19 + y_offset) || 
            (x ==  68  + x_offset && y ==  19 + y_offset) || 
            (x ==  69  + x_offset && y ==  19 + y_offset) || 
            (x ==  70  + x_offset && y ==  19 + y_offset) || 
            (x ==  71  + x_offset && y ==  19 + y_offset) || 
            (x ==  52  + x_offset && y ==  20 + y_offset) || 
            (x ==  59  + x_offset && y ==  20 + y_offset) || 
            (x ==  67  + x_offset && y ==  20 + y_offset) || 
            (x ==  51  + x_offset && y ==  21 + y_offset) || 
            (x ==  59  + x_offset && y ==  21 + y_offset) || 
            (x ==  67  + x_offset && y ==  21 + y_offset) || 
            (x ==  51  + x_offset && y ==  22 + y_offset) || 
            (x ==  59  + x_offset && y ==  22 + y_offset) || 
            (x ==  67  + x_offset && y ==  22 + y_offset) || 
            (x ==  68  + x_offset && y ==  22 + y_offset) || 
            (x ==  51  + x_offset && y ==  23 + y_offset) || 
            (x ==  59  + x_offset && y ==  23 + y_offset) || 
            (x ==  68  + x_offset && y ==  23 + y_offset) || 
            (x ==  51  + x_offset && y ==  24 + y_offset) || 
            (x ==  59  + x_offset && y ==  24 + y_offset) || 
            (x ==  59  + x_offset && y ==  25 + y_offset) || 
            (x ==  59  + x_offset && y ==  26 + y_offset) || 
            (x ==  54  + x_offset && y ==  29 + y_offset) || 
            (x ==  55  + x_offset && y ==  29 + y_offset) || 
            (x ==  56  + x_offset && y ==  29 + y_offset) || 
            (x ==  57  + x_offset && y ==  29 + y_offset) || 
            (x ==  25  + x_offset && y ==  30 + y_offset) || 
            (x ==  54  + x_offset && y ==  30 + y_offset) || 
            (x ==  57  + x_offset && y ==  30 + y_offset) || 
            (x ==  18  + x_offset && y ==  31 + y_offset) || 
            (x ==  19  + x_offset && y ==  31 + y_offset) || 
            (x ==  24  + x_offset && y ==  31 + y_offset) || 
            (x ==  25  + x_offset && y ==  31 + y_offset) || 
            (x ==  53  + x_offset && y ==  31 + y_offset) || 
            (x ==  54  + x_offset && y ==  31 + y_offset) || 
            (x ==  58  + x_offset && y ==  31 + y_offset) || 
            (x ==  19  + x_offset && y ==  32 + y_offset) || 
            (x ==  20  + x_offset && y ==  32 + y_offset) || 
            (x ==  23  + x_offset && y ==  32 + y_offset) || 
            (x ==  24  + x_offset && y ==  32 + y_offset) || 
            (x ==  53  + x_offset && y ==  32 + y_offset) || 
            (x ==  54  + x_offset && y ==  32 + y_offset) || 
            (x ==  55  + x_offset && y ==  32 + y_offset) || 
            (x ==  56  + x_offset && y ==  32 + y_offset) || 
            (x ==  57  + x_offset && y ==  32 + y_offset) || 
            (x ==  58  + x_offset && y ==  32 + y_offset) || 
            (x ==  20  + x_offset && y ==  33 + y_offset) || 
            (x ==  21  + x_offset && y ==  33 + y_offset) || 
            (x ==  23  + x_offset && y ==  33 + y_offset) || 
            (x ==  53  + x_offset && y ==  33 + y_offset) || 
            (x ==  21  + x_offset && y ==  34 + y_offset) || 
            (x ==  22  + x_offset && y ==  34 + y_offset) || 
            (x ==  23  + x_offset && y ==  34 + y_offset) || 
            (x ==  53  + x_offset && y ==  34 + y_offset) || 
            (x ==  21  + x_offset && y ==  35 + y_offset) || 
            (x ==  22  + x_offset && y ==  35 + y_offset) || 
            (x ==  53  + x_offset && y ==  35 + y_offset) || 
            (x ==  54  + x_offset && y ==  35 + y_offset) || 
            (x ==  55  + x_offset && y ==  35 + y_offset) || 
            (x ==  56  + x_offset && y ==  35 + y_offset) || 
            (x ==  57  + x_offset && y ==  35 + y_offset) || 
            (x ==  20  + x_offset && y ==  36 + y_offset) || 
            (x ==  21  + x_offset && y ==  36 + y_offset) || 
            (x ==  22  + x_offset && y ==  36 + y_offset) || 
            (x ==  19  + x_offset && y ==  37 + y_offset) || 
            (x ==  20  + x_offset && y ==  37 + y_offset) || 
            (x ==  23  + x_offset && y ==  37 + y_offset) || 
            (x ==  24  + x_offset && y ==  37 + y_offset) || 
            (x ==  19  + x_offset && y ==  38 + y_offset) || 
            (x ==  24  + x_offset && y ==  38 + y_offset) || 
            (x ==  25  + x_offset && y ==  38 + y_offset) || 
            (x ==  18  + x_offset && y ==  39 + y_offset) || 
            (x ==  87  + x_offset && y ==  43 + y_offset) || 
            (x ==  88  + x_offset && y ==  43 + y_offset) || 
            (x ==  89  + x_offset && y ==  43 + y_offset) || 
            (x ==  87  + x_offset && y ==  44 + y_offset) || 
            (x ==  87  + x_offset && y ==  45 + y_offset) || 
            (x ==  87  + x_offset && y ==  46 + y_offset) || 
            (x ==  87  + x_offset && y ==  47 + y_offset) || 
            (x ==  4  + x_offset && y ==  48 + y_offset) || 
            (x ==  8  + x_offset && y ==  48 + y_offset) || 
            (x ==  87  + x_offset && y ==  48 + y_offset) || 
            (x ==  3  + x_offset && y ==  49 + y_offset) || 
            (x ==  4  + x_offset && y ==  49 + y_offset) || 
            (x ==  5  + x_offset && y ==  49 + y_offset) || 
            (x ==  7  + x_offset && y ==  49 + y_offset) || 
            (x ==  8  + x_offset && y ==  49 + y_offset) || 
            (x ==  9  + x_offset && y ==  49 + y_offset) || 
            (x ==  86  + x_offset && y ==  49 + y_offset) || 
            (x ==  87  + x_offset && y ==  49 + y_offset) || 
            (x ==  2  + x_offset && y ==  50 + y_offset) || 
            (x ==  5  + x_offset && y ==  50 + y_offset) || 
            (x ==  6  + x_offset && y ==  50 + y_offset) || 
            (x ==  7  + x_offset && y ==  50 + y_offset) || 
            (x ==  10  + x_offset && y ==  50 + y_offset) || 
            (x ==  64  + x_offset && y ==  50 + y_offset) || 
            (x ==  65  + x_offset && y ==  50 + y_offset) || 
            (x ==  86  + x_offset && y ==  50 + y_offset) || 
            (x ==  2  + x_offset && y ==  51 + y_offset) || 
            (x ==  6  + x_offset && y ==  51 + y_offset) || 
            (x ==  10  + x_offset && y ==  51 + y_offset) || 
            (x ==  64  + x_offset && y ==  51 + y_offset) || 
            (x ==  65  + x_offset && y ==  51 + y_offset) || 
            (x ==  85  + x_offset && y ==  51 + y_offset) || 
            (x ==  86  + x_offset && y ==  51 + y_offset) || 
            (x ==  2  + x_offset && y ==  52 + y_offset) || 
            (x ==  10  + x_offset && y ==  52 + y_offset) || 
            (x ==  29  + x_offset && y ==  52 + y_offset) || 
            (x ==  30  + x_offset && y ==  52 + y_offset) || 
            (x ==  31  + x_offset && y ==  52 + y_offset) || 
            (x ==  32  + x_offset && y ==  52 + y_offset) || 
            (x ==  33  + x_offset && y ==  52 + y_offset) || 
            (x ==  34  + x_offset && y ==  52 + y_offset) || 
            (x ==  35  + x_offset && y ==  52 + y_offset) || 
            (x ==  84  + x_offset && y ==  52 + y_offset) || 
            (x ==  85  + x_offset && y ==  52 + y_offset) || 
            (x ==  2  + x_offset && y ==  53 + y_offset) || 
            (x ==  10  + x_offset && y ==  53 + y_offset) || 
            (x ==  31  + x_offset && y ==  53 + y_offset) || 
            (x ==  32  + x_offset && y ==  53 + y_offset) || 
            (x ==  33  + x_offset && y ==  53 + y_offset) || 
            (x ==  34  + x_offset && y ==  53 + y_offset) || 
            (x ==  35  + x_offset && y ==  53 + y_offset) || 
            (x ==  36  + x_offset && y ==  53 + y_offset) || 
            (x ==  37  + x_offset && y ==  53 + y_offset) || 
            (x ==  38  + x_offset && y ==  53 + y_offset) || 
            (x ==  61  + x_offset && y ==  53 + y_offset) || 
            (x ==  62  + x_offset && y ==  53 + y_offset) || 
            (x ==  63  + x_offset && y ==  53 + y_offset) || 
            (x ==  64  + x_offset && y ==  53 + y_offset) || 
            (x ==  65  + x_offset && y ==  53 + y_offset) || 
            (x ==  66  + x_offset && y ==  53 + y_offset) || 
            (x ==  67  + x_offset && y ==  53 + y_offset) || 
            (x ==  68  + x_offset && y ==  53 + y_offset) || 
            (x ==  69  + x_offset && y ==  53 + y_offset) || 
            (x ==  3  + x_offset && y ==  54 + y_offset) || 
            (x ==  9  + x_offset && y ==  54 + y_offset) || 
            (x ==  3  + x_offset && y ==  55 + y_offset) || 
            (x ==  4  + x_offset && y ==  55 + y_offset) || 
            (x ==  8  + x_offset && y ==  55 + y_offset) || 
            (x ==  9  + x_offset && y ==  55 + y_offset) || 
            (x ==  64  + x_offset && y ==  55 + y_offset) || 
            (x ==  65  + x_offset && y ==  55 + y_offset) || 
            (x ==  4  + x_offset && y ==  56 + y_offset) || 
            (x ==  8  + x_offset && y ==  56 + y_offset) || 
            (x ==  64  + x_offset && y ==  56 + y_offset) || 
            (x ==  65  + x_offset && y ==  56 + y_offset) || 
            (x ==  5  + x_offset && y ==  57 + y_offset) || 
            (x ==  6  + x_offset && y ==  57 + y_offset) || 
            (x ==  7  + x_offset && y ==  57 + y_offset) || 
            (x ==  6  + x_offset && y ==  58 + y_offset)) oled_data <= light_grey;
        else oled_data <= 0;
    end

endmodule
