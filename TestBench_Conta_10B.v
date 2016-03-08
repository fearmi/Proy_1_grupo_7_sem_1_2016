`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:23:52 03/02/2016
// Design Name:   Conta_10B
// Module Name:   C:/Xilinx/DigitalPWM/TestBench_Conta_10B.v
// Project Name:  DigitalPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Conta_10B
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_Conta_10B;

	// Inputs
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [9:0] out;

	// Instantiate the Unit Under Test (UUT)
	Conta_10B uut (
		.out(out), 
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

