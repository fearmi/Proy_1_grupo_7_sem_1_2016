`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:45 03/01/2016
// Design Name:   Deco_Corriente
// Module Name:   C:/Xilinx/DigitalPWM/TestBench_Deco_Corriente.v
// Project Name:  DigitalPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Deco_Corriente
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_Deco_Corriente;

	// Inputs
	reg [3:0] Corriente;

	// Outputs
	wire [9:0] Referencia;

	// Instantiate the Unit Under Test (UUT)
	Deco_Corriente uut (
		.Corriente(Corriente), 
		.Referencia(Referencia)
	);

	initial begin
		// Initialize Inputs
		Corriente = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Corriente = 4'b0000;
		#100;
		Corriente = 4'b0001;
		#100;
		Corriente = 4'b0010;
		#100;
		Corriente = 4'b0011;
		#100;
		Corriente = 4'b0100;
		#100;
		Corriente = 4'b0101;
		#100;
		Corriente = 4'b0110;
		#100;
		Corriente = 4'b0111;
		#100;
		Corriente = 4'b1000;
		#100;
		Corriente = 4'b1001;
		#100;
		Corriente = 4'b1010;
		#100;
		Corriente = 4'b0000;
		$finish;
		
	end
	
	always @(Corriente)
		$display ("Corriente=%b Referencia=%b",Corriente,Referencia);
	
      
endmodule

