`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 10:55:22
// Design Name: 
// Module Name: upcounter_jk
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



module JK_flipflop (
    input clk,
    input reset,
    input J,
    input K,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 1'b0;
    end else begin
        case ({J, K})
            2'b00: Q <= Q;      // No change
            2'b01: Q <= 1'b0;   // Reset
            2'b10: Q <= 1'b1;   // Set
            2'b11: Q <= ~Q;     // Toggle
        endcase
    end
end

endmodule

module upcounter_jk ( input clk, input reset, output [2:0] Q );

wire Q0, Q1, Q2;

JK_flipflop jk0 ( .clk(clk), .reset(reset), .J(1'b1), .K(1'b1), .Q(Q0) );

JK_flipflop jk1 ( .clk(clk), .reset(reset), .J(Q0), .K(Q0), .Q(Q1) );

JK_flipflop jk2 ( .clk(clk), .reset(reset), .J(Q0 && Q1), .K(Q0 && Q1), .Q(Q2) );

assign Q = {Q2, Q1, Q0};

endmodule
