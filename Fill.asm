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




(MEMOLIMIT)      // Loop back again !! when screen memory is full	
	@KBD
	D=A		
	@MEMOLIMIT
	M=D
	

	@SCREEN		// First initailise base value for BLACK and WHITE screen 
	D=A
	@BLACK_INT
	M=D
	@WHITE_INT
	M=D

	
(CHECK)		// Continue checking if key is pressed or not ?
	
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
	
	// Write white on screen !!!
	
(WHITE)
	@SCREEN
	D=A
	@BLACK_INT
	M=D
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
		
	
	// Write black on screen !!!
(BLACK)
	
	@SCREEN
	D=A
	@WHITE_INT
	M=D
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

