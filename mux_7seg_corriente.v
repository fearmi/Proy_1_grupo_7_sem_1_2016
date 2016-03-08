`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:59 03/05/2016 
// Design Name: 
// Module Name:    mux_7seg_corriente 
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
module mux_7seg_corriente(
input switch,
input  [3:0]n_1f,n_0f,n_2f,n_3f,n_1C,n_2C,n_0C,n_3C,
output [3:0]out_0,out_1,out_2,out_3
    );
reg [3:0]in0,in1,in2,in3;
always @ (*)
begin 
case (switch)
1'b1: begin 
	 in0 = n_0f;
	 in1 = n_1f;
	 in2 = n_2f;
	 in3 = n_3f;
end
1'b0: begin
	in0 = n_0C;
	in1 = n_1C;
	in2 = n_2C;
	in3 = n_3C;
end
endcase
end
assign out_0 = in0, out_1 = in1, out_2 = in2, out_3 = in3;
endmodule

