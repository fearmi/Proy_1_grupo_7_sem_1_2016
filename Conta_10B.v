`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:22 02/28/2016 
// Design Name: 
// Module Name:    Conta_10B 
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
module Conta_10B(
output [9:0]Frecuencia_Conmutacion     ,  // Output of the counter
input Enable  ,  // enable for counter
input Clk     ,  // clock Input
input Reset      // reset Input
);
reg [9:0] sal; //define un reg de 10 bits para asignacion 


always @(posedge Clk or posedge Reset) // cada vez que se tenga un flanco positivo de reloj o de reset
if (Reset) begin // si reset en alto
  sal <= 10'b0 ; // se establece a nivel bajo 
end else if(Enable) begin
  sal <= sal + 1'b1; // actualiza la cuenta, aumenta en un bit la cuenta (1) 
end

assign Frecuencia_Conmutacion=sal; // asigna el valor a la variable de salida
endmodule
