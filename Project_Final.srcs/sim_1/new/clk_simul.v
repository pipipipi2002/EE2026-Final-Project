`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2022 17:28:50
// Design Name: 
// Module Name: clk_simul
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


module clk_simul();
    reg clock; wire clk_out;
    flexible_clk test0 (clock, 10000, clk_out);
    
    initial begin 
        clock = 0;
    end
    always begin 
        #5 clock = ~clock;
    end    
endmodule
