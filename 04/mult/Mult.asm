// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
    @0
    D=M // D = M[0]
    @index
    M=D // index=M[0]
    @2
    M=0 // M[2]=0

(LOOP)
    @index
    D=M
    @END
    D;JEQ // if index ==0 -> jump to END
    @1
    D=M // D=M[1]
    @2
    M=D+M // M[2] += M[1]
    @index
    M = M-1 //index -= 1
    @LOOP
    0;JMP // LOOPへ移動

(END)
    @END
    0;JMP //無限ループ
