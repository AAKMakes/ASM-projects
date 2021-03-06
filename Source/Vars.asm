;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment
 x DB 0
 y DB 0
 z DB 0
 prompt DB "Enter a number>"
 AVG1 DB "The average of "
 AVG2 DB ", and "
 AVG3 DB " is "
 comma DB ", "
MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData

 Main PROC
 include CONIO.INC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;CODE:
   ;Prompt for first number
   MOV AH,9
   LEA DX,prompt
   INT 21h
   ;Now, input it into X
   XOR AX,AX
   Call InputDecByte
   MOV x,AL
   ;Prompt for second number
   MOV AH,9
   LEA DX,prompt
   INT 21h
   ;Now, input it into Y
   XOR AX,AX
   Call InputDecByte
   MOV y,AL
   ;Prompt for third number
   MOV AH,9
   LEA DX,prompt
   INT 21h
   ;Now, input it into Z
   XOR AX,AX
   Call InputDecByte
   MOV z,AL
   
   ;Clear all the registers!
   XOR AX,AX
   XOR BX,BX
   XOR CX,CX
   XOR DX,DX
   
   ;Now that we have all the variables, lets start printing!
   MOV AH,9
   LEA DX,AVG1
   INT 21h
   MOV DL,x
   CALL PrintDecWord
   MOV AH,9
   LEA DX,comma
   INT 21h
   MOV DL,y
   CALL PrintDecWord
   MOV AH,9
   LEA DX,AVG2
   INT 21h
   MOV DL,z
   CALL PrintDecWord
   
   ;EXIT!
   CALL PrintNewLine
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start