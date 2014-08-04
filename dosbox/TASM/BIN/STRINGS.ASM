;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment
 stringToPrint DB "A String$"
MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData

 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   
   MOV AH,9
   LEA DX,stringToPrint
   INT 21h
   
   MOV AH,2
   MOV DL,'%'
   INT 21h
   
   MOV AH,2
   MOV DL,'A'
   INT 21h
   
   MOV AH,2
   MOV DL,'A'
   INT 21h
   
   MOV AH,2
   MOV DL,'B'
   INT 21h
   
   
   
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start