`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:18:03 03/08/2016
// Design Name:   Mux_Frecuencias
// Module Name:   C:/Xilinx/DigitalPWM/TestBench_MuxFrecuencias.v
// Project Name:  DigitalPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_Frecuencias
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_MuxFrecuencias;

	// Inputs
	reg Reset;
	reg [7:0] F_in;
	reg [2:0] Selector;

	// Outputs
	wire Fsw;

	// Instantiate the Unit Under Test (UUT)
	Mux_Frecuencias uut (
		.Reset(Reset), 
		.F_in(F_in), 
		.Selector(Selector), 
		.Fsw(Fsw)
	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		F_in = 0;
		Selector = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	F_in = 8'b10011101;
		#10;
		Selector = 3'b000;
		#10;
		Selector = 3'b001;
		#10;
		Selector = 3'b010;
		#10;
		Selector = 3'b011;
		#10;
		Selector = 3'b100;
		#10;
		Selector = 3'b101;
		#10;
		Selector = 3'b110;
		#10;
		Selector = 3'b111;
		#10;
		

	end
	always @(Selector)
		$display ("Selector=%b Fsw=%b",Selector,Fsw);
	
      
endmodule

