`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2022 09:52:21
// Design Name: 
// Module Name: PItoXY
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


module PItoXY(
    input [12:0] pixel_index,
    output [6:0] cX,
    output [6:0] cY
    );
    
    assign cX = pixel_index % 96;
    assign cY = pixel_index / 96;
endmodule
