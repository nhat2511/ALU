`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:53:19 03/22/2021 
// Design Name: 
// Module Name:    alu 
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
module ALU
			(																							
           input signed [7:0] A,B, // ALU 8-bit Inputs									
			  input [1:0] Sel,																	
			  input CarryIn,
           input [4:0] Opcode,// ALU Opcode
           output [7:0] ALU_Out, // ALU 8-bit Output
			  output reg OverflowFlag =1'b0 ,
           output reg CarryOut = 1'b0 // Carry Out Flag
    );
    reg [7:0] ALU_Result ;
	 reg [15:0] mul_temp ; 
    reg [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    always @(*)
    begin
		if (Opcode == 5'b00001)
			begin
				ALU_Result = A + B ;
				tmp = {1'b0,A} + {1'b0,B};
				CarryOut = tmp[8];
			end
		else
		if (Opcode == 5'b00011)
			begin
				mul_temp = A * B ;
				ALU_Result = mul_temp[7:0];
				OverflowFlag = mul_temp[15] | mul_temp[14] | 
				mul_temp[13] | mul_temp[12] | mul_temp[11] | 
				mul_temp[10] | mul_temp[9] | mul_temp[8] ;
			end
		else
			begin
			CarryOut = 1'b0;																	//T
			OverflowFlag =1'b0;																//O
			case(Opcode)																		//L
        5'b00000: ALU_Result = 8'b0 ; // Default									//I
		  5'b00010: ALU_Result = (A>B)?A - B:B - A ; // Subtraction				//B 
        5'b00100: begin 
						if (Sel==2'b00)														//R
							ALU_Result = A + 1'b1;											//H
						else if (Sel==2'b01)
							ALU_Result = A + 2'b10;  // Increment A					//U
						else if (Sel==2'b10)													//L
							ALU_Result = A + 3'b100;										//I
						else ALU_Result = A + 4'b1000;
						end																		//T
        5'b00101: begin																		//S 
						if ((Sel==2'b00) && (A > 1'b1))									//L
							ALU_Result = A - 1'b1;											//H
						else if ((Sel==2'b01) && (A > 2'b10))							//V
							ALU_Result = A - 2'b10;            // Decrement A
						else if ((Sel==2'b10) && (A > 3'b100))							//D
							ALU_Result = A - 3'b100;										//S
						else if ((Sel==2'b11) && (A > 4'b1000))						//L
							ALU_Result = A - 4'b1000;
						else ALU_Result = A ;												//W
						end 																		//V
		  5'b00110: ALU_Result = ~A[7:0] + 1'b1 ; // Two's complement A		//H
        5'b00111: ALU_Result = ~B[7:0] + 1'b1 ; // Two's complement B		//V
		  5'b01000: ALU_Result = A ; // Pass through A								//I
		  5'b01001: ALU_Result = B ; // Pass through B								//E
		  5'b01010: begin 																	//V
						if (Sel==2'b00)
							ALU_Result = A<<1;
						else if (Sel==2'b01)
							ALU_Result = A<<2;  // A'S Logic Shift left
						else if (Sel==2'b10)
							ALU_Result = A<<3;
						else ALU_Result = A<<4;
						end
		  5'b01011: begin 
						if (Sel==2'b00)
							ALU_Result = A>>1;
						else if (Sel==2'b01)
							ALU_Result = A>>2;  // Logic Shift right
						else if (Sel==2'b10)
							ALU_Result = A>>3;
						else ALU_Result = A>>4;
						end
		  5'b01100: begin 
						if (Sel==2'b00)
							ALU_Result = A<<<1;
						else if (Sel==2'b01)
							ALU_Result = A<<<2;  // A'S Arthmetism shift left
						else if (Sel==2'b10)
							ALU_Result = A<<<3;
						else ALU_Result = A<<<4;
						end  
        5'b01101: begin 
						if (Sel==2'b00)
							ALU_Result = $signed(A)>>>1;
						else if (Sel==2'b01)
							ALU_Result = $signed(A)>>>2;  // Arthmetism shift right
						else if (Sel==2'b10)
							ALU_Result = $signed(A)>>>3;
						else ALU_Result = $signed(A)>>>4;
						end 
        5'b01110: begin 
						if (Sel==2'b00)
							ALU_Result = B<<1;
						else if (Sel==2'b01)
							ALU_Result = B<<2;  // Logic Shift left
						else if (Sel==2'b10)
							ALU_Result = B<<3;
						else ALU_Result = B<<4;
						end
		  5'b01111: begin 
						if (Sel==2'b00)
							ALU_Result = B>>1;
						else if (Sel==2'b01)
							ALU_Result = B>>2;  // Logic Shift right
						else if (Sel==2'b10)
							ALU_Result = B>>3;
						else ALU_Result = B>>4;
						end
		  5'b10000: begin 
						if (Sel==2'b00)
							ALU_Result = B<<<1;
						else if (Sel==2'b01)
							ALU_Result = B<<<2;  // Arthmetism shift left
						else if (Sel==2'b10)
							ALU_Result = B<<<3;
						else ALU_Result = B<<<4;
						end  
        5'b10001: begin 
						if (Sel==2'b00)
							ALU_Result = $signed(B)>>>1;
						else if (Sel==2'b01)
							ALU_Result = $signed(B)>>>2;  // Arthmetism shift right
						else if (Sel==2'b10)
							ALU_Result = $signed(B)>>>3;
						else ALU_Result = $signed(B)>>>4;
						end
		  5'b10010: begin 
						if (Sel==2'b00)
							ALU_Result = {A[6:0],A[7]};
						else if (Sel==2'b01)
							ALU_Result = {A[5:0],A[7:6]};  // Logic Shift left
						else if (Sel==2'b10)
							ALU_Result = {A[4:0],A[7:5]};
						else ALU_Result = {A[3:0],A[7:4]};
						end
		  5'b10011: begin 
						if (Sel==2'b00)
							ALU_Result = {A[0],A[7:1]};
						else if (Sel==2'b01)
							ALU_Result = {A[1:0],A[7:2]};  // Logic Shift right
						else if (Sel==2'b10)
							ALU_Result = {A[2:0],A[7:3]};
						else ALU_Result = {A[3:0],A[7:4]};
						end
		  5'b10100: begin 
						if (Sel==2'b00)
							ALU_Result = {B[6:0],B[7]};
						else if (Sel==2'b01)
							ALU_Result = {B[5:0],B[7:6]};  // Logic Shift left
						else if (Sel==2'b10)
							ALU_Result = {B[4:0],B[7:5]};
						else ALU_Result = {B[3:0],B[7:4]};
						end
		  5'b10101: begin 
						if (Sel==2'b00)
							ALU_Result = {B[0],B[7:1]};
						else if (Sel==2'b01)
							ALU_Result = {B[1:0],B[7:2]};  // Logic Shift right
						else if (Sel==2'b10)
							ALU_Result = {B[2:0],B[7:3]};
						else ALU_Result = {B[3:0],B[7:4]};
						end
		  5'b10110: ALU_Result = ~A[7:0] ; // Logical not A (One's complement)
		  5'b10111: ALU_Result = ~B[7:0] ; // Logical not B (One's complement)
        5'b11000: ALU_Result = A & B ; //  Logical and 
        5'b11001: ALU_Result = A | B ; //  Logical or
        5'b11010: ALU_Result = A ^ B ; //  Logical xor 
        5'b11011: ALU_Result = ~(A[7:0] | B[7:0]) ; //  Logical nor
        5'b11100: ALU_Result = ~(A[7:0] & B[7:0]) ; // Logical nand 
        5'b11101: ALU_Result = ~(A[7:0] ^ B[7:0]) ; // Logical xnor
        5'b11110: 
						begin
						if (Sel==2'b00)
							ALU_Result = {A[6:0],CarryIn} ; // Carry in left rotate A
						else if (Sel==2'b01)
							ALU_Result = {A[5:0],CarryIn,A[7]};  
						else if (Sel==2'b10)
							ALU_Result = {A[4:0],CarryIn,A[7:6]};
						else ALU_Result = {A[3:0],CarryIn,A[7:5]};
						end
        5'b11111: begin 
						if (Sel==2'b00)
							ALU_Result = {CarryIn,B[7:1]};
						else if (Sel==2'b01)
							ALU_Result = {B[0],CarryIn,B[7:2]};  // Carry in right rotate B
						else if (Sel==2'b10)
							ALU_Result = {B[1:0],CarryIn,B[7:3]};
						else ALU_Result = {B[2:0],CarryIn,B[7:4]};
						end   
        endcase
			end       
    end
endmodule

