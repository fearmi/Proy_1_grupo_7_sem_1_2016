`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:07 03/02/2016 
// Design Name: 
// Module Name:    DivisorFrecuencia 
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
module DivisorFrecuencia(
 input wire Clock_i,reset_i, //se define una señal de reloj de entrada, corresponde al Clock de la Nexys, 100MHz
 (* BUFFER_TYPE="BUFG" *)output reg Clock_o //se define una señal de salidad de reloj, con la nueva frecuencia  
    );
 
 reg [15:0] contador ; //se define un reg llamado contador para truncar la señal del Clock de Nexys cuando llegue




always @(posedge Clock_i) //Especificamos la transición deseada, en cada flanco positivo de la señal  
 begin
 if (reset_i) // si reset en alto entonces
 begin
	contador<=16'd0; // se reinicia el contador
	Clock_o <=1'b0; // la salida del nuevo reloj se establece a nivel bajo
	end
	else
	begin
      if (contador == 16'd49_999 )//si contador llega a 32050 el contador salta a cero y de esa forma se trunca al valor deseado
		  begin                   
			contador <=16'd0;      // se reinicia el contador
		   Clock_o <= ~Clock_o;// se niega el clock de salida para que pase a 1 
			end 
		else //en caso contrario
		   contador <= contador + 1'b1; //se actualiza el estado del contador
 
  end 
  end
endmodule 