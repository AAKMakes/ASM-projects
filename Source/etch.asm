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
INCLUDE CONIO.INC
;End of includes
DRAW PROC
 MOV BYTE PTR [DI],CL
 RET
DRAW ENDP
GetChar PROC ;Puts char in AL
 MOV AH,08h
 INT 21h
 RET
GetChar ENDP
UP PROC
 SUB DI,320
 RET
 UP ENDP
DOWN PROC
ADD DI,320
RET
DOWN ENDP
LEFT PROC
SUB DI,1
RET
LEFT ENDP
RIGHT PROC
ADD DI,1
RET
RIGHT ENDP
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
  
   PUSH DS
   MOV AH,0
   MOV AL,13h
   INT 10h   
   
   MOV AX,0A000h
   MOV DS,AX
   
   MOV DI,00000h
   
   MOV CX,32000+160 ;Trial and error says that this is the center
   ADD DI,CX
   XOR CX,CX
   CALL DRAW
   MOV CL,12
   LoopStuff:
   CALL Draw
   CALL GetChar
   PUSH AX
   CMP AL,'w'
   JE goUp
   CMP AL,'s'
   JE goDown
   POP AX
   CMP AL,1Bh
   JE Exit
   CMP AL,'a'
   JE lft
   CMP AL,'d'
   JE rgt
   CMP AL,9
   JE col
   cmp AL,' '
   JE clr
   JMP LoopStuff
   clr:
   MOV AH,0
   MOV AL,03h
   INT 10h
   MOV AH,0
   MOV AL,13h
   INT 10h
   JMP LoopStuff
   col:
   INC CL
   JMP LoopStuff
   goUp:
   CALL UP
   JMP LoopStuff
   lft:
   CALL left
   JMP LoopStuff
   rgt:
   CALL RIGHT
   JMP LoopStuff
   goDown:
   CALL DOWN
   
   JMP LoopStuff
   
	Exit:
	;CALL Pause
	POP DS
	MOV AH,0
	MOV AL,03h
	INT 10h
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