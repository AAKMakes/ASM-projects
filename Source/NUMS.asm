;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment
  namePrompt DB "What is your name? ","$"
  nameBuffer DB "1234567890123456"
  ageprompt DB "How old are you?$"
  tenyears DB "In 10 years, $"
  isstr DB " will be $"
  yold DB " years old$"
  num1 DB "Num1>$"
  num2 DB "Num2>$"
  minus DB " minus $"
  equals DB " equals $"
MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData

 Main PROC
 include CONIO.INC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AH,9
   LEA DX,namePrompt
   INT 21h
   
   MOV AH,9
   LEA DX,nameBuffer
   Call InputStr
   
   MOV AH,9
   LEA DX,ageprompt
   INT 21h
   
   MOV AH,9
   Call InputDecByte
   MOV BL,AL
   
   MOV AH,9
   LEA DX,tenyears
   INT 21h
   
   MOV AH,9
   LEA DX,nameBuffer
   INT 21h
   
   MOV AH,9
   LEA DX,isstr
   INT 21h
   
   ADD BL,10
   
   MOV AH,9
   MOV DL,BL
   Call PrintDecByte
   
   MOV AH,9
   LEA DX,yold
   Int 21h
   
   Call PrintNewLine
   
   ;End of EX1
   
   ;Output prompt
   MOV AH,9
   LEA DX,num1
   INT 21h
   
   ;Input Number
   MOV AH,9
   Call InputDecByte
   MOV BL,AL ;Store the number in BL
   
   MOV AH,9
   LEA DX,num2
   INT 21h ;Prompting for second number
   
   MOV AH,9
   Call InputDecByte ;Puts second num in AL
   MOV CL,AL ;Puts AL into CL
   ADD BL,CL ;Adds CL to BL, storing in BL
   
   MOV AH,9
   MOV DL,BL
   CALL PrintDecByte ;OUTPUTS BL by storing in DL
   
   CALL PrintNewLine
   
   SUB BL,CL
   
   MOV AH,9
   MOV DL,BL
   CALL PrintDecByte
   
   MOV AH,9
   LEA DX,minus
   INT 21h
   
   MOV DL,CL
   Call PrintDecByte
   
   MOV AH,9
   LEA DX,equals
   INT 21h
   
   MOV DL,BL
   SUB DL,CL
   CALL PrintDecByte
   CALL PrintNewLine
   
   XOR CX,CX
   XOR DX,DX
   XOR AH,AH
   XOR BH,BH
   
   MOV DL,AL
   Call PrintDecWord
   MOV DL,BL
   Call PrintDecWord
   
   MOV AL,BL
   MUL CL
   MOV DX,AX
   CALL PrintDecWord
   CALL PrintNewLine
   
   MOV AL,BL
   DIV CL
   
   MOV BL,DL
   MOV DL,AL
   CALL PrintDecByte
   CALL PrintNewLine
   MOV DL,BL
   CALL PrintDecWord
   
   
   ;End of program
   CALL PrintNewLine
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start