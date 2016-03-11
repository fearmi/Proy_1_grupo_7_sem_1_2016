`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:06 03/03/2016 
// Design Name: 
// Module Name:    up_down_cnt 
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

module up_down_cnt_c (up_c, down_c, reset_c,enable_c, out_c);
input        up_c, down_c, reset_c,enable_c;
output [3:0] out_c;


wire up_c, down_c, reset_c,enable_c;
reg [3:0] out_c ;

reg count_up, count_down;

always @(posedge up_c or posedge down_c)
  if (up_c) count_up <= 1'b1;
  else       count_up <= 1'b0;

always @(posedge up_c or posedge down_c)
  if (down_c)   count_down <= 1'b1;
  else       count_down <= 1'b0;


 (* BUFFER_TYPE="BUFG" *) wire count_pulse = up_c ^ down_c;

always @ (posedge count_pulse or posedge reset_c) 
  begin
    if      (reset_c)  out_c <= 4'b0000;
    
    else if (~enable_c) if (count_up)   if (out_c==4'b1010)   out_c <= out_c; else out_c<=out_c+1'b1;else if (count_down) if (out_c==4'b0000)   out_c <= out_c; else out_c<=out_c-1'b1;
    //else                   out <= out;
end
endmodule
