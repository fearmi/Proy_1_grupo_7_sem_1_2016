`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:23:00 03/02/2016
// Design Name:   Comparador
// Module Name:   C:/Xilinx/DigitalPWM/TestBench_Comparador.v
// Project Name:  DigitalPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_Comparador;

	// Inputs
	reg [9:0] Frec_Conm;
	reg [9:0] Corri_Ref;

	// Outputs
	wire Out_PWM;

	// Instantiate the Unit Under Test (UUT)
	Comparador uut (
		.Frec_Conm(Frec_Conm), 
		.Corri_Ref(Corri_Ref), 
		.Out_PWM(Out_PWM)
	);

	initial begin
		// Initialize Inputs
		Frec_Conm = 0;
		Corri_Ref = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	
		
		Frec_Conm = ~Frec_Conm;
	
		
		Corri_Ref = 10'b0000000000;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b0001100110;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b0011001101;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b0100110011;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b0110011010;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b1000000000;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b1001100110;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b1011001101;
		Frec_Conm = ~Frec_Conm;
		#10; 
		Corri_Ref = 10'b1100110011;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b1110011010;
		Frec_Conm = ~Frec_Conm;
		#10;
		Corri_Ref = 10'b1111111111;
		Frec_Conm = ~Frec_Conm;
		#10;
		
		$stop;
	end
      
endmodule

