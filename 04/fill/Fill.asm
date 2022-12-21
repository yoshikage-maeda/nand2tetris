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
    @8192   //SCREEN SIZE
    D=A
    @number_of_pixel
    M=D


    @R0
    M=0     //スクリーンは最初空である
(LOOP)
    // キーボードからの入力を受け取る
    @KBD
    D=M
    @KEY_PUSHED
    D;JNE
(KEY_NOT_PUSHED)
    @R1
    M=0
    @CHECK_STATE_CHANGE
    0;JMP
(KEY_PUSHED)
    @R1
    M=1
(CHECK_STATE_CHANGE)
    @R0
    D=M
    @R1
    D=D-M
    @LOOP
    D;JEQ   // R0 != R1 のときに、スクリーンをアップデートする
    @i
    M=0
    @R1
    D=M
    @R0
    M=D
    @EMPTY_SCREEN_LOOP
    D;JEQ   //R1=0だったら、スクリーンを真っ白にする
(FILL_SCREEN_LOOP)
    @i
    D=M
    @number_of_pixel
    D=M-D
    @LOOP
    D;JLT
    @SCREEN
    A=A+D
    M=1
    @i
    MD=M+1
    @FILL_SCREEN_LOOP
    0;JMP
(EMPTY_SCREEN_LOOP)
    @i
    D=M
    @number_of_pixel
    D=M-D
    @LOOP
    D;JLT
    @SCREEN
    A=A+D
    M=0
    @i
    MD=M+1
    @EMPTY_SCREEN_LOOP
    0;JMP
