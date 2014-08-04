;
; Comment
;

; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
  quotientMsg DB "Quotient: $"
  remainderMsg DB "Remainder: $"
  promptMsg DB "Enter two numbers:",13,10,"$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
include CONIO.INC
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   MOV AH,9
   LEA DX,promptMsg
   INT 21h
   
   CALL InputDecWord
   
   PUSH AX
   Call InputDecWord
   MOV BX,AX
   Pop AX
   MOV DX,0
   DIV BX
   
   PUSH DX
   Push AX
   MOV AH,9
   LEA DX,quotientMsg
   Int 21h
   
   POP AX
   MOV DX,AX
   CALL PrintDecWord
   Call PrintNewLine
   
   MOV AH,9
   LEA DX,remainderMsg
   Int 21h
   
   POP DX
   CALL PrintDecWord
   ;End of your code.
   XOR AX,AX
   XOR BX,BX
   XOR CX,CX
   XOR DX,DX
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start
