`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2022 01:22:44
// Design Name: 
// Module Name: srff
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


module srff(
    input s,
    input r,
    input clk,
    output q,
    output qbar
    );
    wire nand1_out; // output of nand1 
    wire nand2_out; // output of nand2 
    
    nand (nand1_out,clk,s); 
    nand (nand2_out,clk,r); 
    nand (q,nand1_out,qbar);
    nand (qbar,nand2_out,q);
endmodule
