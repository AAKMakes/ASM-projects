;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment
example1 DB "A",13,10,"B",13,10,"$"
example2 DB "1 Knollwood Drive",13,10,"Larchmont, NY 10538",13,10,"$"
example3 DB "_|_|_",13,10,"_|_|_",13,10," | | $"
MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData

 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX

   
   MOV AH,9
   LEA DX,example1
   INT 21h
   
   MOV AH,9
   LEA DX,example2
   INT 21h
   
   MOV AH,9
   LEA DX,example3
   INT 21h
   
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start