`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:27:49 03/08/2016
// Design Name:   DivisorFrecuencia
// Module Name:   C:/Xilinx/DigitalPWM/TestBench_DivisorFrec.v
// Project Name:  DigitalPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DivisorFrecuencia
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_DivisorFrec;

	// Inputs
	reg Clock_i;
	reg reset_i;

	// Outputs
	wire Clock_o;

	// Instantiate the Unit Under Test (UUT)
	DivisorFrecuencia uut (
		.Clock_i(Clock_i), 
		.reset_i(reset_i), 
		.Clock_o(Clock_o)
	);

	initial begin
		// Initialize Inputs
		Clock_i = 0;
		reset_i = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
      reset_i = 1'b1;
		#100;
		reset_i = 1'b0;
	end

	always begin #10000000 Clock_in=~Clock_in;
	end
      
endmodule

