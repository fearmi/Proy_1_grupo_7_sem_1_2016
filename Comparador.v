`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:33 02/29/2016 
// Design Name: 
// Module Name:    Comparador 
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
module Comparador( //comparador para obtener la salida de señal de PWM
    input [9:0] Frec_Conm, //frecuencia de conmutación 
    input [9:0] Corri_Ref, //corriente referencia, modula el ciclo de trabajo
    output Out_PWM //salida de pulso con ancho modulado
    );
	 
	 assign Out_PWM= (Frec_Conm < Corri_Ref) ? 1'b1 : 1'b0; // asigna un 1 a la salida si la frecuencia de conmutación
	                                                        // es menor a la referencia, en caso contrario asigna 0,de forma
																		//que se logra modelar el ciclo de trabajo estableciendo la referencia
	 


endmodule // finaliza el módulo
