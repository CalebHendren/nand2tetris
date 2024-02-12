// This file was not given as per the instructions. Created on my own.
// Comments are all on same line to save time in the assembler (before finding the fast translation button...). Spaces were added later.
@R2
M=0 // Set R2 to 0

(LOOP) //Loop for repeated addition

@R1
D=M // Load R1 into D register

@END
D;JEQ  // If R1 is 0, END

@R0
D=M // Load R0 into D register

@R2 
M=M+D // Add R0 to R2

@R1
M=M-1 // Subtract by 1. Loop ends when it reaches 0

@LOOP
0;JMP // Jump back to LOOP to repeat addition

(END)
@END
0;JMP // Infinite loop to stop program.