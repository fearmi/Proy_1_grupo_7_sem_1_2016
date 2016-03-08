`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:27 03/08/2016
// Design Name:   Conta_8B
// Module Name:   C:/Xilinx/DigitalPWM/TestBench_Contador8Bits.v
// Project Name:  DigitalPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Conta_8B
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_Contador8Bits;

	// Inputs
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] F_out;

	// Instantiate the Unit Under Test (UUT)
	Conta_8B uut (
		.F_out(F_out), 
		.enable(enable), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		enable = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1'b1;
	   repeat (2) #10 clk=~clk;
		reset = 1'b0;
		enable = 1'b1;
		repeat (2048) #100 clk=~clk;
		$stop;

	end
      
endmodule

