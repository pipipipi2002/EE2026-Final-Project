`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 04:29:21
// Design Name: 
// Module Name: morse_code_tick
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


module morse_code_tick(
    input clk,
    input [6:0] x, y,
    output reg [15:0] oled_data
    );

    parameter [15:0] green = 16'b00000_111111_00000;
    always @(posedge clk) begin
        if ((x ==  65 && y ==  30 ) || (x ==  66 && y ==  30 ) || (x ==  67 && y ==  30 ) || (x ==  68 && y ==  30 ) || (x ==  69 && y ==  30 ) || (x ==  70 && y ==  30 ) || (x ==  71 && y ==  30 ) || (x ==  72 && y ==  30 ) || (x ==  73 && y ==  30 ) || (x ==  65 && y ==  31 ) || (x ==  72 && y ==  31 ) || (x ==  73 && y ==  31 ) || (x ==  65 && y ==  32 ) || (x ==  71 && y ==  32 ) || (x ==  73 && y ==  32 ) || (x ==  65 && y ==  33 ) || (x ==  70 && y ==  33 ) || (x ==  73 && y ==  33 ) || (x ==  65 && y ==  34 ) || (x ==  66 && y ==  34 ) || (x ==  70 && y ==  34 ) || (x ==  73 && y ==  34 ) || (x ==  65 && y ==  35 ) || (x ==  67 && y ==  35 ) || (x ==  69 && y ==  35 ) || (x ==  73 && y ==  35 ) || (x ==  65 && y ==  36 ) || (x ==  68 && y ==  36 ) || (x ==  73 && y ==  36 ) || (x ==  65 && y ==  37 ) || (x ==  66 && y ==  37 ) || (x ==  67 && y ==  37 ) || (x ==  68 && y ==  37 ) || (x ==  69 && y ==  37 ) || (x ==  70 && y ==  37 ) || (x ==  71 && y ==  37 ) || (x ==  72 && y ==  37 ) || (x ==  73 && y ==  37 )
) oled_data <= green;
        else oled_data <= 0;
    end
endmodule
