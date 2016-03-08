`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:18 03/05/2016 
// Design Name: 
// Module Name:    deco_7seg_frecuencia 
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
module deco_7seg_frecuencia(
input [2:0] indicadorFrecuencia,
output [3:0]n_1f,n_0f,n_2f,n_3f
);
 

reg [3:0]n1,n2,n0,n3; 
 
always @(indicadorFrecuencia) 
begin
case(indicadorFrecuencia)
3'b000 :begin
			n0 = 4'd9;
			n1 = 4'd3;
			n2 = 4'd10; 
			n3 = 4'd0;
		end
3'b001 :begin
			n0 = 4'd8;
			n1 = 4'd7;
			n2 = 4'd10;
			n3 = 4'd0;
		end
3'b010 :begin
			n0 = 4'd6;
			n1 = 4'd5;
			n2 = 4'd10;
			n3 = 4'd1;
		end
3'b011 :begin 
			n0 = 4'd2;
			n1 = 4'd1;
			n2 = 4'd10;
			n3 = 4'd3;
		end
3'b100  :begin
			n0 = 4'd5;
			n1 = 4'd2;
			n2 = 4'd10;
			n3 = 4'd6;
		end
3'b101 :begin
			n0 = 4'd5;
			n1 = 4'd10;
			n2 = 4'd2;
			n3 = 4'd1;
		end
3'b110 :begin
			n0 = 4'd0;
			n1 = 4'd10;
			n2 = 4'd5;
			n3 = 4'd2;
		end 
3'b111 :begin
			n0 = 4'd0; 
			n1 = 4'd10;
			n2 = 4'd0;
			n3 = 4'd5;
		end
		default begin
		n0 = 4'd0;
		n1 = 4'd0;
		n2 = 4'd0;
		n3 = 4'd0;
		end
endcase
end 
assign n_0f = n0,n_1f = n1,n_2f = n2,n_3f = n3;
endmodule 