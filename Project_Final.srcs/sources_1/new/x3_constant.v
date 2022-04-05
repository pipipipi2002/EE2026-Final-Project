`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2022 17:44:04
// Design Name: 
// Module Name: x3_constant
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


module x3_constant(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data 
    );
    parameter [15:0] blue = 16'b10100_011000_11011;

    always @(posedge clk) begin
        if ((x ==  62  && y ==  32 ) || 
            (x ==  63  && y ==  32 ) || 
            (x ==  61  && y ==  33 ) || 
            (x ==  64  && y ==  33 ) || 
            (x ==  63  && y ==  34 ) || 
            (x ==  61  && y ==  35 ) || 
            (x ==  64  && y ==  35 ) || 
            (x ==  51  && y ==  36 ) || 
            (x ==  52  && y ==  36 ) || 
            (x ==  57  && y ==  36 ) || 
            (x ==  58  && y ==  36 ) || 
            (x ==  62  && y ==  36 ) || 
            (x ==  63  && y ==  36 ) || 
            (x ==  51  && y ==  37 ) || 
            (x ==  52  && y ==  37 ) || 
            (x ==  57  && y ==  37 ) || 
            (x ==  58  && y ==  37 ) || 
            (x ==  51  && y ==  38 ) || 
            (x ==  52  && y ==  38 ) || 
            (x ==  57  && y ==  38 ) || 
            (x ==  58  && y ==  38 ) || 
            (x ==  51  && y ==  39 ) || 
            (x ==  52  && y ==  39 ) || 
            (x ==  57  && y ==  39 ) || 
            (x ==  58  && y ==  39 ) || 
            (x ==  53  && y ==  40 ) || 
            (x ==  54  && y ==  40 ) || 
            (x ==  55  && y ==  40 ) || 
            (x ==  56  && y ==  40 ) || 
            (x ==  53  && y ==  41 ) || 
            (x ==  54  && y ==  41 ) || 
            (x ==  55  && y ==  41 ) || 
            (x ==  56  && y ==  41 ) || 
            (x ==  51  && y ==  42 ) || 
            (x ==  52  && y ==  42 ) || 
            (x ==  57  && y ==  42 ) || 
            (x ==  58  && y ==  42 ) || 
            (x ==  51  && y ==  43 ) || 
            (x ==  52  && y ==  43 ) || 
            (x ==  57  && y ==  43 ) || 
            (x ==  58  && y ==  43 ) || 
            (x ==  51  && y ==  44 ) || 
            (x ==  52  && y ==  44 ) || 
            (x ==  57  && y ==  44 ) || 
            (x ==  58  && y ==  44 ) || 
            (x ==  51  && y ==  45 ) || 
            (x ==  52  && y ==  45 ) || 
            (x ==  57  && y ==  45 ) || 
            (x ==  58  && y ==  45 )) oled_data <= blue;
        else oled_data <= 0;
    end

endmodule
