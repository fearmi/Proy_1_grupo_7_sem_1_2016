`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:18 03/07/2016 
// Design Name: 
// Module Name:    FFD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FFD(
    input data,
    input reset_FFD,
    input clock,
    output q
    );
reg g;
always @(posedge clock or posedge reset_FFD)
if (reset_FFD)
g<=1'b0;
else
g<=data;

assign q=g;


endmodule
