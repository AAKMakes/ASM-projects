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
  blastoff DB "BLASTOFF!",13,10,"$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here

INCLUDE TIME.INC
INCLUDE CONIO.INC

;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AX,1
   CALL DelayForSecs
   
   MOV DL,3
   CALL PrintDecByte
   CALL PrintNewLine
   
   MOV AX,1
   CALL DelayForSecs
   
   MOV DL,2
   CALL PrintDecByte
   CALL PrintNewLine
   
   MOV AX,1
   CALL DelayForSecs
   
   MOV DL,1
   CALL PrintDecByte
   CALL PrintNewLine
   
   MOV AX,1
   CALL DelayForSecs
   
   MOV AH,9
   LEA DX,blastoff
   INT 21h
   
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