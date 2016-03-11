`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:08:53 03/04/2016 
// Design Name: 
// Module Name:    Prueba_NUEVO 
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
module Prueba_NUEVO(//modulo principal, aca se instancia todo
   (* BUFFER_TYPE="BUFG" *) input B_UP,B_DOWN,//botones de entrada, aumento o decremento
   (* BUFFER_TYPE="BUFG" *) input CLOCK,//señal de reloj de entrada, clock de nexys 
    input RESET,//master reset del sistema
	 input ENABLE,//habilitador de contadores
	 input E_SWITCH,//selector de modos
	 output A,B,C,D,E,F,G,DP,//salidas a 7 segmentos
	 output [3:0] AN,//salidas habilitadoras de anodos
	 output PWM//señal de ancho de pulso modulad0
    //output [9:0] FREC_CONMU
    );
//se definen variables de conexiones internas entre modulos
wire [7:0] F_out;//primera division de frecuencias
wire [2:0] out_f;//salida para seleccion de frecuencia
(* BUFFER_TYPE="BUFG" *) wire Fsw;//señal de reloj a contador de 10 bits
wire [9:0] Frecuencia_Conmutacion;//frecuencia de conmutacion para comparador
wire [9:0] Referencia;//referencia de corriente del comparador
wire [3:0] out_c;//salida para seleccion de corriente
wire Out_Sinc_UP; // señal de subida estable, salida de antireboe
wire Out_Sinc_DOWN;//señal de bajada estable, salida de antirebote
wire Clock_o;//clock para antirebotes, 10kHz

// Instantiate the module
DivisorFrecuencia DIV ( //modulo divisor de frecuencia
    .Clock_i(CLOCK),  //clock de nexys
    .reset_i(RESET), //reset del sistema
    .Clock_o(Clock_o) //señal de clock a antirebotes
    );
// Instantiate the module
Antirebote boton1 ( //antirebote para boton de incremento
    .Boton(B_UP), 
    .Clock(Clock_o), 
    .Reset(RESET), 
    .Out_Sinc(Out_Sinc_UP)
    );// Instantiate the module
Antirebote boton2 ( //antirebote para boton de decremento
    .Boton(B_DOWN), 
    .Clock(Clock_o), 
    .Reset(RESET), //reset del sistema
    .Out_Sinc(Out_Sinc_DOWN)
    );
// Instantiate the module
Conta_8B Contador8Bits ( // generador de frecuencias 
    .F_out(F_out), 
    .enable(ENABLE), 
    .clk(CLOCK), 
    .reset(RESET) //reset del sistema
    );
// Instantiate the module
up_down_cnt_f SelectorFrecuencias (
    .up_f(Out_Sinc_UP), //señal de incremento de antirebote
    .down_f(Out_Sinc_DOWN), //señal de decremento de antitrebote
    .reset_f(RESET), //reset del sistema
    .enable_f(E_SWITCH), //interruptor de seleccion de modo
    .out_f(out_f)//salida de corriente a decodificador de corriente
    );
// Instantiate the module
Mux_Frecuencias MuxFrecuencia( //mux selector de frecuencias de conmutacion
    .Reset(RESET),//reset del sistema 
    .F_in(F_out), //señales de reloj a distinta frecuencia
    .Selector(out_f), //selector de frecuencia
    .Fsw(Fsw)//salida
    ); 

// Instantiate the module
Conta_10B Contador10Bits ( //contador generador de frecuencias de conmutacion
    .Frecuencia_Conmutacion(Frecuencia_Conmutacion), 
    .Enable(ENABLE), 
    .Clk(Fsw), //señal de reloj para generar la frecuencia seleccionada en el mux
    .Reset(RESET)//reset del sistema
    );
// Instantiate the module
Comparador ComparadorPWM ( //comparador para generar pulso de ancho modulado
    .Frec_Conm(Frecuencia_Conmutacion), //frecuencia de conmutacion
    .Corri_Ref(Referencia), // referencia para generar ciclo de trabajo basado en corriente
    .Out_PWM(PWM)//salida modulada
    ); 
Deco_Corriente DecoCorriente( // decodificador de corrientes
    .Clock(CLOCK), //clock de nexys
    .Reset(RESET), //reset del sistema
    .Corriente(out_c), //selector de corriente
    .Referencia(Referencia) // Referencia para el comparador
    );
up_down_cnt_c SelectorCorriente ( //modulo selector de corriente
    .up_c(Out_Sinc_UP), 
    .down_c(Out_Sinc_DOWN), 
    .reset_c(RESET), //reset del sistema
    .enable_c(E_SWITCH),//interruptor de seleccion 
    .out_c(out_c)
    );

// Instantiate the module
Modulo_Display_7seg Display_7segmentos ( //modulo de display 7 segmentos
    .iF(out_f), //entrada de frecuencia
    .iC(out_c), //entraada de corriente
    .switch(E_SWITCH), //interruptor de seleccion
    .clock(CLOCK), //clock de nexys
    .reset(RESET), //reset del sistem
    .a(A), //salida a catodo
    .b(B), 
    .c(C), 
    .d(D), 
    .e(E), 
    .f(F), 
    .g(G), //salida a catodo
    .dp(DP), //salida a punto decimal
    .an(AN)//salida habilitadora de anodo
    );



endmodule
