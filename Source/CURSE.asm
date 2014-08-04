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
  CURSE DB "F",7,"*",7,"*",7,"*",7,7,7,7,"$"
MyData endS

















MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
INCLUDE CONIO.INC
PrintString PROC ;Put string in BX. Uses CX. Is nice enough to use stack to restore it.
 PUSH CX
 PUSH DX
 PUSH AX
 MOV SI,BX
 
 
 LoopThing:
  XOR AX,AX
  MOV AH,2
  MOV DL,[SI]
  INT 21h
  INC SI  
  CMP[SI], 0036
  JE EndLoop
  JMP LoopThing
 EndLoop:
 
 POP AX
 POP DX
 POP CX
 RET
 PrintString ENDP
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   LEA BX,CURSE
   Call PrintString
   
   
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