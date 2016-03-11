`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:45:58 03/04/2016 
// Design Name: 
// Module Name:    up_down_cnt_f 
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


module up_down_cnt_f (up_f, down_f, reset_f,enable_f, out_f);
input        up_f, down_f, reset_f,enable_f;
output [2:0] out_f;


wire up_f, down_f, reset_f,enable_f;
reg [2:0] out_f ;

reg count_up, count_down;

always @(posedge up_f or posedge down_f)
  if (up_f) count_up <= 1'b1;
  else       count_up <= 1'b0;

always @(posedge up_f or posedge down_f)
  if (down_f)   count_down <= 1'b1;
  else       count_down <= 1'b0;


(* BUFFER_TYPE="BUFG" *)wire count_pulse = up_f ^ down_f;

always @ (posedge count_pulse or posedge reset_f) 
  begin
    if      (reset_f)  out_f <= 3'b000; 
	 else if (enable_f)  if (count_up)   if (out_f==3'b111)   out_f <= out_f; else out_f<=out_f+1'b1; else if (count_down) if (out_f==3'b000)   out_f <= out_f; else out_f<=out_f-1'b1;
    //else                   out <= out;
end

endmodule
