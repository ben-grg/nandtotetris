// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Compte Multiplication R2 = R1 * R0

// Psedo-code:
// R2 = R1 x R0
// let R2 = 0
// LOOP : R2 = R2 + R1 and R0 = R0 - 1 if R0 = 0 STOP

		// initialize R2 value 

	@R2
	M=0
	
	
	// get R1 value and put in DRegister	
(GOTO)
	@R1	
	D=M
	@R2	// Add value of R1 from DRegister to value of R2 which is 0 at inital
	M=D+M
	@R0
	D=M
	M=D-1
	D=M
	@STOP
	D;JEQ
	@GOTO
	0;JMP

(STOP)
	@STOP
	0;JMP