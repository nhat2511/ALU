`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:00:48 03/25/2021
// Design Name:   ALU
// Module Name:   D:/xilinx/alu/testbench.v
// Project Name:  alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] B;
	reg [4:0] Opcode;
	reg [1:0] Sel;

	// Outputs
	wire [15:0] ALU_Out;
	wire CarryOut;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.Opcode(Opcode), 
		.ALU_Out(ALU_Out), 
		.CarryOut(CarryOut)
	);

	initial begin
		// Initialize Inputs
		A = 8'b11100111;
		B = 8'b10011000;
		Sel = 2'b11;
		Opcode = 5'b00101;

		// Wait 100 ns for global reset to finish
		#100;
      

		// Add stimulus here

	end
      
endmodule

