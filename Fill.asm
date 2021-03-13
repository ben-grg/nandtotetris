// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// SCREEN is 512 pixels (16 x32) and 256 rows 
// Pseudo-code : LOOP 16284--24575 == -1 (BLACK) when 24576 is not 0 else 16284--24575 == 0 (WHITE)


// check if any key is pressed or not

	
	@KBD
	D=A		//memory check make memory limit to RAM[last]-1
	@MEMOLIMIT
	M=D

	@SCREEN
	D=A
	@BLACK_INT
	M=D
	@WHITE_INT
	M=D
	
(CHECK)
	@KBD
	D=M
	@CHECK
	M=D
	@BLACK
	M=D
	@BLACK
	M;JNE
	@WHITE
	M=D
	@WHITE
	M;JEQ
	@CHECK
	0;JMP

	
(WHITE)
	
	@WHITE_INT
	D=M
	@MEMOLIMIT
	M-D;JEQ
	A=D
	M=0
	D=A
	D=D+1
	@WHITE_INT
	M=D
	@CHECK
	0;JMP
	@WHITE
	0;JMP
		
	
	// write black on screen
(BLACK)
	

	@BLACK_INT
	D=M
	@MEMOLIMIT
	M-D;JEQ
	A=D
	M=-1
	D=A
	D=D+1
	@BLACK_INT
	M=D
	@CHECK
	0;JMP
	@BLACK
	0;JMP


	// write white on screen


	
(MEMOLIMIT)
	@END
	0;JMP

(END)
	@END
	0;JMP