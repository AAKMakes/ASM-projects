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
  
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here

;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   PUSH DS
   MOV AX,0B800h
   MOV DS,AX
   
   MOV DI,00000h
   MOV CX,1000
   
   FillScreenLoop:
    MOV AH,2
    MOV DL,1
    INT 21h
    MOV AH,2
    MOV DL,2
    INT 21h
	INC DI
	INC DI
	LOOP FillScreenLoop
   POP DS
   
   
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