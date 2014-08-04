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
  timeis DB "The current local time is $"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
INCLUDE CONIO.INC
INCLUDE TIME.INC

;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AH,9
   LEA DX,timeis
   INT 21h
   
   MOV AH,2CH
   INT 21h
   
   PUSH DX
   PUSH CX
   
   POP CX
   MOV DL,CH
   CALL PrintDecByte
   
   MOV AH,2
   MOV DX,":"
   INT 21h
   
   MOV DL,CL
   CALL PrintDecByte
   
   MOV AH,2
   MOV DX,":"
   INT 21h
   
   POP DX
   MOV BL,DL
   MOV DL,DH
   CALL PrintDecByte
   
   MOV AH,2
   MOV DX,"."
   INT 21h
   
   MOV DL,BL
   CALL PrintDecByte
    
   
   
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