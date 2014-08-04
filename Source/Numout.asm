;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment

MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData
include CONIO.INC
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   
   MOV DL,57
   CALL PrintDecByte
   
   CALL PrintNewline
   
   MOV DX,27634
   CALL PrintDecWord
   
   CALL PrintNewLine
   Call PrintNewLine
   
   MOV DX,1984
   CALL PrintDecWord
   CALL PrintNewline
   MOV DX,84
   CALL PrintDecWord
   
   CALL PrintNewLine
   
   MOV DX,19
   CALL PrintDecByte
   MOV DX,84
   CALL PrintDecByte
   CALL PrintNewLine
   
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start