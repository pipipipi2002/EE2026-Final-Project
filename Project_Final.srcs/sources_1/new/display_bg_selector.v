`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 15:25:37
// Design Name: 
// Module Name: display_bg_selector
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


module display_bg_selector(
    input clk,
    input [7:0] x,y,
    output reg [15:0] oled_data,
    input [1:0] select_num 
    );
    parameter [15:0] yellow = 16'b11111_101011_00001;
    wire [7:0] y_offset;

    assign y_offset =  (select_num == 0) ? 0 : (
                        (select_num == 1) ? 10 : (
                        (select_num == 2) ? 20 : (
                        (select_num == 3) ? 30 : 0)));

    always @(posedge clk) begin
        if ((x ==  2  && y ==  12 + y_offset) || 
            (x ==  3  && y ==  12 + y_offset) || 
            (x ==  4  && y ==  12 + y_offset) || 
            (x ==  5  && y ==  12 + y_offset) || 
            (x ==  6  && y ==  12 + y_offset) || 
            (x ==  7  && y ==  12 + y_offset) || 
            (x ==  8  && y ==  12 + y_offset) || 
            (x ==  9  && y ==  12 + y_offset) || 
            (x ==  10  && y ==  12 + y_offset) || 
            (x ==  11  && y ==  12 + y_offset) || 
            (x ==  12  && y ==  12 + y_offset) || 
            (x ==  13  && y ==  12 + y_offset) || 
            (x ==  14  && y ==  12 + y_offset) || 
            (x ==  15  && y ==  12 + y_offset) || 
            (x ==  16  && y ==  12 + y_offset) || 
            (x ==  17  && y ==  12 + y_offset) || 
            (x ==  18  && y ==  12 + y_offset) || 
            (x ==  19  && y ==  12 + y_offset) || 
            (x ==  20  && y ==  12 + y_offset) || 
            (x ==  21  && y ==  12 + y_offset) || 
            (x ==  22  && y ==  12 + y_offset) || 
            (x ==  23  && y ==  12 + y_offset) || 
            (x ==  24  && y ==  12 + y_offset) || 
            (x ==  25  && y ==  12 + y_offset) || 
            (x ==  26  && y ==  12 + y_offset) || 
            (x ==  27  && y ==  12 + y_offset) || 
            (x ==  28  && y ==  12 + y_offset) || 
            (x ==  29  && y ==  12 + y_offset) || 
            (x ==  30  && y ==  12 + y_offset) || 
            (x ==  31  && y ==  12 + y_offset) || 
            (x ==  32  && y ==  12 + y_offset) || 
            (x ==  33  && y ==  12 + y_offset) || 
            (x ==  34  && y ==  12 + y_offset) || 
            (x ==  35  && y ==  12 + y_offset) || 
            (x ==  36  && y ==  12 + y_offset) || 
            (x ==  37  && y ==  12 + y_offset) || 
            (x ==  38  && y ==  12 + y_offset) || 
            (x ==  39  && y ==  12 + y_offset) || 
            (x ==  40  && y ==  12 + y_offset) || 
            (x ==  41  && y ==  12 + y_offset) || 
            (x ==  42  && y ==  12 + y_offset) || 
            (x ==  43  && y ==  12 + y_offset) || 
            (x ==  44  && y ==  12 + y_offset) || 
            (x ==  45  && y ==  12 + y_offset) || 
            (x ==  46  && y ==  12 + y_offset) || 
            (x ==  47  && y ==  12 + y_offset) || 
            (x ==  48  && y ==  12 + y_offset) || 
            (x ==  49  && y ==  12 + y_offset) || 
            (x ==  50  && y ==  12 + y_offset) || 
            (x ==  51  && y ==  12 + y_offset) || 
            (x ==  52  && y ==  12 + y_offset) || 
            (x ==  53  && y ==  12 + y_offset) || 
            (x ==  54  && y ==  12 + y_offset) || 
            (x ==  55  && y ==  12 + y_offset) || 
            (x ==  56  && y ==  12 + y_offset) || 
            (x ==  57  && y ==  12 + y_offset) || 
            (x ==  58  && y ==  12 + y_offset) || 
            (x ==  59  && y ==  12 + y_offset) || 
            (x ==  60  && y ==  12 + y_offset) || 
            (x ==  61  && y ==  12 + y_offset) || 
            (x ==  62  && y ==  12 + y_offset) || 
            (x ==  63  && y ==  12 + y_offset) || 
            (x ==  64  && y ==  12 + y_offset) || 
            (x ==  65  && y ==  12 + y_offset) || 
            (x ==  66  && y ==  12 + y_offset) || 
            (x ==  67  && y ==  12 + y_offset) || 
            (x ==  68  && y ==  12 + y_offset) || 
            (x ==  69  && y ==  12 + y_offset) || 
            (x ==  70  && y ==  12 + y_offset) || 
            (x ==  71  && y ==  12 + y_offset) || 
            (x ==  72  && y ==  12 + y_offset) || 
            (x ==  73  && y ==  12 + y_offset) || 
            (x ==  74  && y ==  12 + y_offset) || 
            (x ==  75  && y ==  12 + y_offset) || 
            (x ==  76  && y ==  12 + y_offset) || 
            (x ==  77  && y ==  12 + y_offset) || 
            (x ==  78  && y ==  12 + y_offset) || 
            (x ==  79  && y ==  12 + y_offset) || 
            (x ==  80  && y ==  12 + y_offset) || 
            (x ==  81  && y ==  12 + y_offset) || 
            (x ==  82  && y ==  12 + y_offset) || 
            (x ==  83  && y ==  12 + y_offset) || 
            (x ==  84  && y ==  12 + y_offset) || 
            (x ==  85  && y ==  12 + y_offset) || 
            (x ==  86  && y ==  12 + y_offset) || 
            (x ==  87  && y ==  12 + y_offset) || 
            (x ==  88  && y ==  12 + y_offset) || 
            (x ==  89  && y ==  12 + y_offset) || 
            (x ==  90  && y ==  12 + y_offset) || 
            (x ==  91  && y ==  12 + y_offset) || 
            (x ==  92  && y ==  12 + y_offset) || 
            (x ==  93  && y ==  12 + y_offset) || 
            (x ==  94  && y ==  12 + y_offset) || 
            (x ==  2  && y ==  13 + y_offset) || 
            (x ==  94  && y ==  13 + y_offset) || 
            (x ==  2  && y ==  14 + y_offset) || 
            (x ==  94  && y ==  14 + y_offset) || 
            (x ==  2  && y ==  15 + y_offset) || 
            (x ==  94  && y ==  15 + y_offset) || 
            (x ==  2  && y ==  16 + y_offset) || 
            (x ==  94  && y ==  16 + y_offset) || 
            (x ==  2  && y ==  17 + y_offset) || 
            (x ==  94  && y ==  17 + y_offset) || 
            (x ==  2  && y ==  18 + y_offset) || 
            (x ==  94  && y ==  18 + y_offset) || 
            (x ==  2  && y ==  19 + y_offset) || 
            (x ==  94  && y ==  19 + y_offset) || 
            (x ==  2  && y ==  20 + y_offset) || 
            (x ==  3  && y ==  20 + y_offset) || 
            (x ==  4  && y ==  20 + y_offset) || 
            (x ==  5  && y ==  20 + y_offset) || 
            (x ==  6  && y ==  20 + y_offset) || 
            (x ==  7  && y ==  20 + y_offset) || 
            (x ==  8  && y ==  20 + y_offset) || 
            (x ==  9  && y ==  20 + y_offset) || 
            (x ==  10  && y ==  20 + y_offset) || 
            (x ==  11  && y ==  20 + y_offset) || 
            (x ==  12  && y ==  20 + y_offset) || 
            (x ==  13  && y ==  20 + y_offset) || 
            (x ==  14  && y ==  20 + y_offset) || 
            (x ==  15  && y ==  20 + y_offset) || 
            (x ==  16  && y ==  20 + y_offset) || 
            (x ==  17  && y ==  20 + y_offset) || 
            (x ==  18  && y ==  20 + y_offset) || 
            (x ==  19  && y ==  20 + y_offset) || 
            (x ==  20  && y ==  20 + y_offset) || 
            (x ==  21  && y ==  20 + y_offset) || 
            (x ==  22  && y ==  20 + y_offset) || 
            (x ==  23  && y ==  20 + y_offset) || 
            (x ==  24  && y ==  20 + y_offset) || 
            (x ==  25  && y ==  20 + y_offset) || 
            (x ==  26  && y ==  20 + y_offset) || 
            (x ==  27  && y ==  20 + y_offset) || 
            (x ==  28  && y ==  20 + y_offset) || 
            (x ==  29  && y ==  20 + y_offset) || 
            (x ==  30  && y ==  20 + y_offset) || 
            (x ==  31  && y ==  20 + y_offset) || 
            (x ==  32  && y ==  20 + y_offset) || 
            (x ==  33  && y ==  20 + y_offset) || 
            (x ==  34  && y ==  20 + y_offset) || 
            (x ==  35  && y ==  20 + y_offset) || 
            (x ==  36  && y ==  20 + y_offset) || 
            (x ==  37  && y ==  20 + y_offset) || 
            (x ==  38  && y ==  20 + y_offset) || 
            (x ==  39  && y ==  20 + y_offset) || 
            (x ==  40  && y ==  20 + y_offset) || 
            (x ==  41  && y ==  20 + y_offset) || 
            (x ==  42  && y ==  20 + y_offset) || 
            (x ==  43  && y ==  20 + y_offset) || 
            (x ==  44  && y ==  20 + y_offset) || 
            (x ==  45  && y ==  20 + y_offset) || 
            (x ==  46  && y ==  20 + y_offset) || 
            (x ==  47  && y ==  20 + y_offset) || 
            (x ==  48  && y ==  20 + y_offset) || 
            (x ==  49  && y ==  20 + y_offset) || 
            (x ==  50  && y ==  20 + y_offset) || 
            (x ==  51  && y ==  20 + y_offset) || 
            (x ==  52  && y ==  20 + y_offset) || 
            (x ==  53  && y ==  20 + y_offset) || 
            (x ==  54  && y ==  20 + y_offset) || 
            (x ==  55  && y ==  20 + y_offset) || 
            (x ==  56  && y ==  20 + y_offset) || 
            (x ==  57  && y ==  20 + y_offset) || 
            (x ==  58  && y ==  20 + y_offset) || 
            (x ==  59  && y ==  20 + y_offset) || 
            (x ==  60  && y ==  20 + y_offset) || 
            (x ==  61  && y ==  20 + y_offset) || 
            (x ==  62  && y ==  20 + y_offset) || 
            (x ==  63  && y ==  20 + y_offset) || 
            (x ==  64  && y ==  20 + y_offset) || 
            (x ==  65  && y ==  20 + y_offset) || 
            (x ==  66  && y ==  20 + y_offset) || 
            (x ==  67  && y ==  20 + y_offset) || 
            (x ==  68  && y ==  20 + y_offset) || 
            (x ==  69  && y ==  20 + y_offset) || 
            (x ==  70  && y ==  20 + y_offset) || 
            (x ==  71  && y ==  20 + y_offset) || 
            (x ==  72  && y ==  20 + y_offset) || 
            (x ==  73  && y ==  20 + y_offset) || 
            (x ==  74  && y ==  20 + y_offset) || 
            (x ==  75  && y ==  20 + y_offset) || 
            (x ==  76  && y ==  20 + y_offset) || 
            (x ==  77  && y ==  20 + y_offset) || 
            (x ==  78  && y ==  20 + y_offset) || 
            (x ==  79  && y ==  20 + y_offset) || 
            (x ==  80  && y ==  20 + y_offset) || 
            (x ==  81  && y ==  20 + y_offset) || 
            (x ==  82  && y ==  20 + y_offset) || 
            (x ==  83  && y ==  20 + y_offset) || 
            (x ==  84  && y ==  20 + y_offset) || 
            (x ==  85  && y ==  20 + y_offset) || 
            (x ==  86  && y ==  20 + y_offset) || 
            (x ==  87  && y ==  20 + y_offset) || 
            (x ==  88  && y ==  20 + y_offset) || 
            (x ==  89  && y ==  20 + y_offset) || 
            (x ==  90  && y ==  20 + y_offset) || 
            (x ==  91  && y ==  20 + y_offset) || 
            (x ==  92  && y ==  20 + y_offset) || 
            (x ==  93  && y ==  20 + y_offset) || 
            (x ==  94  && y ==  20 + y_offset)) oled_data <= yellow;
        else oled_data <= 0;
    end

endmodule
