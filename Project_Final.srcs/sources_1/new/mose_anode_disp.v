`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 08:33:10
// Design Name: 
// Module Name: morse_anode_disp
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


module morse_anode_disp(
  input CLOCK,
  input [7:0] data,
  output reg [3:0] Anode_Activate, // anode signals of the 7-segment LED display
  output reg [6:0] LED_out,// cathode patterns of the 7-segment LED display
  output reg dp
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
          NUM = data[1:0];
            end
      1: begin
          Anode_Activate = 4'b1011; 
          NUM = data[3:2];
            end
      2: begin
          Anode_Activate = 4'b1101; 
          NUM = data[5:4];
              end
      3: begin
          Anode_Activate = 4'b1110; 
          NUM = data[7:6];
             end
      endcase
      
    if(NUM == 2'b00)begin
        LED_out = 7'b1111111; // " "   
        dp = 1;  
    end
    if(NUM == 2'b01)begin
        LED_out = 7'b1111111; // "."     
        dp = 0;
    end
    if(NUM == 2'b10)begin
        LED_out = 7'b0111111; // "-"
        dp = 1;     
    end
  end
endmodule