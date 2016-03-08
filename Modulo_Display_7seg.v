`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:06 03/05/2016 
// Design Name: 
// Module Name:    Modulo_Display_7seg 
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
module Modulo_Display_7seg(
input [2:0]iF, // entrada de frecuencia, viene del selector de frecuencia
input [3:0]iC, // entrada de corriente, viene del selector de frecuencia
input switch,clock,reset, // señales de entrada de reloj, reset e interruptor de seleccion de modo
output  a,b,c,d,e,f,g,dp, // salidas para generar num en display
output [3:0]an // salida para activar los anodos
    );
wire [3:0]n_0f,n_1f,n_2f,n_3f,n_1C,n_2C,n_3C,n_0C,out_0,out_1,out_2,out_3;

deco_7seg_frecuencia d_7seg_frecuencia (
    .indicadorFrecuencia(iF), 
    .n_1f(n_1f), 
    .n_0f(n_0f), 
    .n_2f(n_2f), 
    .n_3f(n_3f) 
    );
	 
deco_7seg_corriente  d_7seg_corriente(
    .indicadorCoriente(iC), 
    .n_1C(n_1C), 
    .n_2C(n_2C), 
    .n_0C(n_0C), 
    .n_3C(n_3C)
    );

mux_7seg_corriente MuxSelectorDisplay (
    .switch(switch), 
    .n_1f(n_1f), 
    .n_0f(n_0f), 
    .n_2f(n_2f), 
    .n_3f(n_3f), 
    .n_1C(n_1C), 
    .n_2C(n_2C), 
    .n_0C(n_0C), 
    .n_3C(n_3C), 
    .out_0(out_0), 
    .out_1(out_1), 
    .out_2(out_2), 
    .out_3(out_3)
    );

sevenseg Display7Segmentos (
    .clock(clock), 
    .reset(reset), 
    .in0(out_0), 
    .in1(out_1), 
    .in2(out_2), 
    .in3(out_3), 
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .e(e), 
    .f(f), 
    .g(g), 
    .dp(dp), 
    .an(an)
    );
    


endmodule
