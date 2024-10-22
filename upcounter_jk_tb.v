`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 10:55:49
// Design Name: 
// Module Name: upcounter_jk_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module upcounter_jk_tb;
  reg clk;
  reg reset;
  wire [2:0] Q;

  upcounter_jk uut ( .clk(clk), .reset(reset), .Q(Q) );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reset = 1;
    #10 reset = 0;
    #100 $finish;
  end

endmodule
