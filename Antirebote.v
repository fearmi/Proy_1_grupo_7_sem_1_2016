`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:34 03/07/2016 
// Design Name: 
// Module Name:    Antirebote 
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
module Antirebote(
    input Boton, //entrada de boton
	 input Clock, //entrada de reloj, funciona a 10kHz
	 input Reset, // entrada de reset
    (* BUFFER_TYPE="BUFG" *)output Out_Sinc // salida del antirebote
    );
wire q1,q2,q3,q4; // definimos wires para conexiones internas
//se definen 4 ffd para lograr establecer el valor y lograr observar el flanco positivo en el cambio de la señal
// Instantiate the module
FFD FFD1 ( 
    .data(Boton), //entrada de boton
    .reset_FFD(Reset), //entrada de reset
    .clock(Clock), //entrada de reloj
    .q(q1) //salida de ffd1
    );
// Instantiate the module
FFD FFD2 (
    .data(q1), //entrada de dato
    .reset_FFD(Reset),//entrada de reset 
    .clock(Clock), //entrada de reloj
    .q(q2)//salida de ffd2
    );
	 
// Instantiate the module
FFD FFD3 (
    .data(q2), //entrada de dato 
    .reset_FFD(Reset),//entrada de reset 
    .clock(Clock), //entrada de reloj
    .q(q3)//salida de ffd3
    );
	 
// Instantiate the module
FFD FFD4 (
    .data(q3),  //entrada de dato
    .reset_FFD(Reset),//entrada de reset 
    .clock(Clock), //entrada de reloj
    .q(q4)//salida de ffd4
    );
	 
	 
assign Out_Sinc=q1&q2&q3&q4; // asigna la salida de una and de 4 entradas, me aseguro que hay un nivel alto
// de esta forma me aseguro que se estabiliza el valor del pulsador


endmodule
