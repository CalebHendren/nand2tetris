// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Initialize screenColor register
@screenColor
M=-1     
// Set D to 0 for clearing the screen
D=0        
// Jump to the UpdateScreen label to set the screen to the initial color
@UpdateScreen
0;JMP

// Loop that checks keyboard and updates screen
(CheckKeyboard)
// Loads last keypress into D
@KBD
D=M
// If D is 0, clear the screen
@UpdateScreen
D;JEQ
// If a key is pressed, set D to -1 set the screen to black
D=-1

// Update the screen based on D's value
(UpdateScreen)
// Store the color in ARG register
@ARG
M=D
// Calculate the change in screen color status by subtracting the current screen color from the intended color
@screenColor
D=D-M
// If there's no change in color, skip screen update
@CheckKeyboard
D;JEQ
    
// Store the new color value in screenColor
@ARG
D=M
@screenColor
M=D
    
// Initialize pixelIndex
@SCREEN
D=A
@8192
D=D+A
@pixelIndex
M=D
    
// Loop to color each pixel on the screen with the value in screenColor
(ColorPixels)
// Move to previous pixel
@pixelIndex
D=M-1
M=D
// If the pixel index is less than the SCREEN start address, all pixels have been colored
@CheckKeyboard
D;JLT
    
// Color the current pixel with the value in screenColor
@screenColor
D=M 
@pixelIndex
A=M     
M=D 
// Loop to color the next pixel
@ColorPixels
0;JMP