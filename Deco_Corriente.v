`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:56 02/28/2016 
// Design Name: 
// Module Name:    Deco_Corriente 
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
module Deco_Corriente(
input Clock,//entrada de reloj
input Reset, //entrada de reset
input wire [3:0] Corriente, //corresponde al valor binario que representa cada valor de corriente
output wire [9:0] Referencia // 10 bits que van al comparador, llamados referencia
    );

reg [9:0] deco_out; // se define un registro para asignar el valor de la salida segun la corriente

always @(posedge Clock or posedge Reset) // siempre que haya un cambio en la corriente
if (Reset) begin
deco_out<=10'b0000000000; // establece el reg al nivel bajo
end
else
case (Corriente) // se evalua cada expresión y en función a eso se asigna un valor
4'b0000 : deco_out <= 10'b0000000000; //ciclo de trabajo al 0%
4'b0001 : deco_out <= 10'b0001100110; //ciclo de trabajo al 10%
4'b0010 : deco_out <= 10'b0011001101; //ciclo de trabajo al 20%
4'b0011 : deco_out <= 10'b0100110011; //ciclo de trabajo al 30%
4'b0100 : deco_out <= 10'b0110011010; //ciclo de trabajo al 40%
4'b0101 : deco_out <= 10'b1000000000; //ciclo de trabajo al 50%
4'b0110 : deco_out <= 10'b1001100110; //ciclo de trabajo al 60%
4'b0111 : deco_out <= 10'b1011001101; //ciclo de trabajo al 70%
4'b1000 : deco_out <= 10'b1100110011; //ciclo de trabajo al 80%
4'b1001 : deco_out <= 10'b1110011010; //ciclo de trabajo al 90%
4'b1010 : deco_out <= 10'b1111111111; //ciclo de trabajo al 100%
default: deco_out <= 10'b0000000000;  // esta es la condicion de salida del decodificador por defecto
endcase//finaliza el case
	 
assign Referencia = deco_out; // se asigna valor a la variable wire deco_salida

endmodule
