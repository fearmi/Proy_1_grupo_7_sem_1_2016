`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:19 03/05/2016 
// Design Name: 
// Module Name:    deco_7seg_corriente 
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
module deco_7seg_corriente(
input [3:0] indicadorCoriente,
output [3:0]n_1C,n_2C,n_0C,n_3C
);


reg [3:0]n1,n2,n0,n3; 
 
always @(indicadorCoriente) 
begin
case(indicadorCoriente)
4'b0000 :begin
			n0 = 4'd0;
			n1 = 4'd0;
			n2 = 4'd0; 
			n3 = 4'd0;
		end
4'b0001 :begin
			n0 = 4'd10;
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd1;
		end
4'b0010 :begin
			n0 = 4'd10;
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd2;
		end
4'b0011 :begin 
			n0 = 4'd10;
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd3;
		end
4'b0100  :begin
			n0 = 4'd10;
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd4;
		end
4'b0101 :begin
			n0 = 4'd10;
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd5;
		end
4'b0110 :begin
			n0 = 4'd10;
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd6;
		end 
4'b0111 :begin
			n0 = 4'd10; 
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd7;
		end
4'b1000 :begin
			n0 = 4'd10; 
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd8;
		end
4'b1001 :begin
			n0 = 4'd10; 
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd9;
		end
4'b1010 :begin
			n0 = 4'd0; 
			n1 = 4'd0;
			n2 = 4'd0;
			n3 = 4'd1;
		end
		default begin
		 n0 = 4'd10;
		 n1 = 4'd10;
		 n2 = 4'd10;
		 n3 = 4'd10;
		 end
endcase
end 
assign n_0C = n0,n_1C = n1,n_2C = n2,n_3C = n3;
endmodule
    



