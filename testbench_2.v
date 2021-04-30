`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:34:28 03/29/2021
// Design Name:   ALU
// Module Name:   D:/xilinx/alu/testbench_2.v
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

module testbench_2;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [1:0] Sel;
	reg [4:0] Opcode;
	reg [0:0] CarryIn;

	// Outputs
	wire [7:0] ALU_Out;
	wire CarryOut;
	wire OverflowFlag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B),  
		.Sel(Sel), 
		.Opcode(Opcode), 
		.CarryIn(CarryIn),
		.ALU_Out(ALU_Out), 
		.CarryOut(CarryOut),
		.OverflowFlag(OverflowFlag)
	);
	//always #1 clk=~clk;
	initial begin
		// Initialize Inputs
		A = 8'b11100111;
		B = 8'b10011000;
		Sel = 2'b10;
		CarryIn=1'b1;
		Opcode = 5'd0;
		// Wait 100 ns for global reset to finish
		#1;
		Opcode = 5'd1;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd2;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd3;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd4;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd5;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd6;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd7;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd8;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd9;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd10;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd11;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd12;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd13;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd14;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd15;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd16;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd17;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd18;
//		for global reset to finish
		#1;
		
		Opcode = 5'd19;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd20;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd21;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd22;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd23;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd24;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd25;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd26;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd27;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd28;
		// Wait 100 n for global reset to finish
		#1;
		
		Opcode = 5'd29;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd30;
		// Wait 100 ns for global reset to finish
		#1;
		
		Opcode = 5'd31;
		//Wait 100 ns for global reset to finish
		#1;
		
		
		
        
		// Add stimulus here

	end
      
endmodule

