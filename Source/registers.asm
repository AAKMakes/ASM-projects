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
   
   XOR DX, DX ; Clear register
   ;MOV DL,5
   ;MOV DX,1024
   MOV DL,27
   CALL PrintDecWord
   
   
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start