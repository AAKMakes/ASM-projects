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
  prompt1 DB "ENTER NUM>$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
include CONIO.inc
;End of includes
 Main PROC
  Start:
   MOV AX, MyData
   MOV DS, AX
   ;Start of your code

   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   PUSH AX
   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   MOV BX,AX
   PUSH BX
    
   POP BX
   MOV DX,BX
   CALL PrintDecWord
   
   CALL PrintNewLine
   
   POP AX
   MOV DX,AX
   CALL PrintDecWord
   
   CALL PrintNewLine
   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   PUSH AX
   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   MOV BX,AX
   PUSH BX
   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   MOV CX,AX
   PUSH CX
   
   POP CX
   MOV DX,CX
   CALL PrintDecWord
   
   CALL PrintNewLine
   
   POP BX
   
   POP AX
   MOV DX,AX
   CALL PrintDecWord
   
   CALL PrintNewLine
   
   ;EX3
   XOR AX,AX
   XOR BX,BX
   XOR CX,CX
   XOR DX,DX
   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   PUSH AX
   
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   
   CALL InputDecWord
   MOV BX,AX
   PUSH BX
   
   POP BX
   POP AX
   
   SUB AX,BX
   MOV DX,AX
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