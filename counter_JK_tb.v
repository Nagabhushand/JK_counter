`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 10:40:23
// Design Name: 
// Module Name: counter_JK_tb
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


module counter_JK_tb;
  reg clk;
  reg reset;
  wire [2:0] Q;

  counter_JK uut ( .clk(clk), .reset(reset), .Q(Q) );

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

