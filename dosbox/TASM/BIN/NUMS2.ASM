;First ASM
Mystack segment stack
 DB 64 dup('12345678')
Mystack endS
 
MyData segment
  num1 DB "Num1>$"
  num2 DB "Num2>$"
  multiplied DB " times $"
  equals DB " equals $"
  dividemsg DB " divided by $"
  remainder DB " with remainder $"
MyData endS

MyCode segment
 Assume CS:Mycode,DS:MyData
include CONIO.INC
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   
   ;Ask the user to input the first number
   MOV AH,9
   LEA DX,num1
   INT 21h
   
   ;Get the first number and store it in register BH
   XOR AH,AH
   Call InputDecByte
   MOV BH,AL
   
   ;Ask the user to input the second number
   MOV AH,9
   LEA DX,num2
   INT 21h
   
   ;Get the second number and store it in BL
   XOR AH,AH   
   CALL InputDecByte
   MOV BL,AL
   XOR AL,AL
   
   ;Now, the first number is saved in BH and the second in BL. Save it in AX
   MOV AL,BH
   MUL BL
   MOV CX,AX
   
   ;Begin printing:
   XOR DX,DX
   MOV DL,BH
   CALL PrintDecWord
   MOV AH,9
   LEA DX,multiplied
   INT 21h
   XOR DX,DX
   MOV DL,BL
   CALL PrintDecWord
   XOR DX,DX
   MOV AH,9
   LEA DX,equals
   INT 21h
   XOR DX,DX
   XOR AX,AX
   
   ;Move CX to DX and print it.
   MOV AH,9
   MOV DX,CX
   Call PrintDecWord
   
   ;Newline
   Call PrintNewLine
   
   ;Since all we care about is in BX, we will clear AX,CX,and DX.
   XOR AX,AX
   XOR CX,CX
   XOR DX,DX
   
   ;Now, we will do the division. Will be BH/BL We will save the result in CH, the remainder in CL.
   MOV AL,BH
   DIV BL
   ;Q=AL,R=DL
   ;Call PrintDecWord

   MOV CL,AH
   MOV CH,AL
   
   ;CALL PrintDecByte
   ;Call PrintNewLine
   ;MOV DL,AL
   ;CALL PrintDecByte
   ;Now, we will print
   
   XOR AX,AX
   MOV AH,9
   MOV DL,BH
   CALL PrintDecByte
   MOV AH,9
   LEA DX,dividemsg
   INT 21h
   XOR DX,DX
   MOV DL,BL
   CALL PrintDecByte
   XOR AX,AX
   XOR DX,DX
   MOV AH,9
   LEA DX,equals
   INT 21h
   MOV AH,9
   XOR AX,AX
   XOR DX,DX
   MOV DL,CH
   CALL PrintDecByte
   MOV AH,9
   LEA DX,remainder
   INT 21h
   MOV AH,9
   MOV DL,CL
   CALL PrintDecByte
   
   ;Done!
   Call PrintNewLine
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start