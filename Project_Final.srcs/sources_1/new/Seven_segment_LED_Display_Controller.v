`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 19:21:41
// Design Name: 
// Module Name: Seven_segment_LED_Display_Controller
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


module Seven_segment_LED_Display_Controller(
    input CLOCK,
    input [13:0] displayed_number,
    output reg [3:0] Anode_Activate, // anode signals of the 7-segment LED display
    output reg [6:0] LED_out// cathode patterns of the 7-segment LED display
    );
    
    reg [3:0] NUM;
    reg [1:0] LED_activating_counter=0; 
    
    wire clock_100_out;
    flexible_clk clock_200(CLOCK,400,clock_100_out);

    always @ (posedge clock_100_out)begin
        LED_activating_counter <= LED_activating_counter + 1;
        case(LED_activating_counter)
        0: begin
            Anode_Activate = 4'b0111; 
            NUM = displayed_number/1000;
              end
        1: begin
            Anode_Activate = 4'b1011; 
            NUM = (displayed_number % 1000)/100;
              end
        2: begin
            Anode_Activate = 4'b1101; 
            NUM = (displayed_number %100)/10;
                end
        3: begin
            Anode_Activate = 4'b1110; 
            NUM = displayed_number %10;
               end
        endcase
        
        case(NUM)
        4'b0000: LED_out = 7'b1000000; // "0"     
        4'b0001: LED_out = 7'b1111001; // "1" 
        4'b0010: LED_out = 7'b0100100; // "2" 
        4'b0011: LED_out = 7'b0110000; // "3" 
        4'b0100: LED_out = 7'b0011001; // "4" 
        4'b0101: LED_out = 7'b0010010; // "5" 
        4'b0110: LED_out = 7'b0000010; // "6" 
        4'b0111: LED_out = 7'b1111000; // "7" 
        4'b1000: LED_out = 7'b0000000; // "8"     
        4'b1001: LED_out = 7'b0010000; // "9" 
        default: LED_out = 7'b1000000; // "0"
        endcase
    end
 endmodule