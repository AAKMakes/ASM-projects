;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment
  namePrompt DB "What is your name? ","$"
  nameBuffer DB "1234567890123456"
  helloMsg DB "Hello, ","$"
  buffer1 DB "A Long First Name$"
  buffer2 DB "A Long Last Name$"
  buffer3 DB "abc"
  buffer4 DB "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  buffer5 DB "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
  prompt1 DB "What's your first name?$"
  prompt2 DB "What's your last name?$"
  prompt3 DB "How old are you?$"
  prompt4 DB "Num1>$"
  prompt5 DB "Num2>$"
  coolage DB " is a cool age$"
MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData
include CONIO.INC
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Code Here
   MOV AH,9
   LEA DX,namePrompt
   INT 21h
   MOV AH,16
   LEA DX,nameBuffer
   CALL InputStr
   MOV AH,9
   LEA DX,helloMsg
   INT 21h  
   MOV AH,9
   LEA DX,nameBuffer
   INT 21h
   CALL PrintNewLine
   ;End of example
   MOV AH,9
   LEA DX,prompt1
   Int 21h
   LEA DX,buffer1
   CALL InputStr
   MOV AH,9
   LEA dx,prompt2
   Int 21h
   MOV AH,9
   LEA DX,buffer2
   CALL InputStr
   MOV AH,9
   LEA DX,helloMsg
   INT 21h
   MOV AH,9
   LEA DX,buffer1
   INT 21h
   MOV AH,2
   MOV DL,' '
   INT 21h
   MOV AH,9
   LEA DX,buffer2
   INT 21h
   CALL PrintNewLine
   ;End or ex1
   MOV AH,9
   LEA DX,prompt3
   Int 21h
   MOV AH,9
   LEA DX,buffer3
   CALL InputStr
   MOV AH,9
   LEA DX,buffer3
   INT 21h
   MOV AH,9
   LEA DX,coolage
   INT 21h
   Call PrintNewLine
   ;End of ex2
   MOV AH,9
   LEA DX,prompt4
   INT 21h
   MOV AH,9
   LEA DX,buffer4
   CALL InputStr
   MOV AH,9
   LEA DX,prompt5
   INT 21h
   MOV AH,9
   LEA DX,buffer5
   Call InputStr
   Call PrintNewLine
   MOV AH,9
   LEA DX,buffer5
   INT 21h
   MOV AH,2
   MOV DL,','
   INT 21h
   MOV AH,9
   LEA DX,buffer4
   INT 21h
   CALL PrintNewLine
   
   ;Exit Program
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start