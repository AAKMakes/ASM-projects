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
  prompt DB "Which letter? (1-25): $"
  alphabet DB "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
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
   LEA DX,DS:prompt                ; Let DS:DX = offset of "prompt" within DS
   INT 21h
   CALL InputDecWord
   
   MOV CX,AX
  ; DEC CX                          ; CX is now the offset of letter within alphabet. (1-25)
   
   ADD CX,OFFSET DS:alphabet       ; CX is increased by the memory location of alphabet within DS.
   
   MOV SI,CX                       ;DI = offset to the letter within DS
   MOV BL,[SI]                     ; Gets letter at DS:DI
   
   MOV AH,2
   MOV DL,BL
   INT 21h
   
   CALL PrintNewLine
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