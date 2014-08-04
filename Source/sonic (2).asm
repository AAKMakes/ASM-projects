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
  nlength DW ?
  note DW ?
  
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
INCLUDE TIME.INC
INCLUDE CONIO.INC
;End of includes
 playNote PROC ;Hertz should be in note, length in centiseconds should be in nlength
  PUSH AX
  PUSH BX
  PUSH CX
  PUSH DX
  ;Prep time divisor
  MOV AL,0B6h
  OUT 43h,AL
  
  ;Calculate time divisor
  MOV DX,0012h
  MOV AX,2870h
  DIV note
  
  ;Set speaker
  OUT 42h,AL
  MOV AL,AH
  OUT 42h,AL
  
  ;Activate pc speaker
  IN AL,61h
  OR AL,00000011b
  OUT 61h,AL
  
  ;Wait time
  MOV AX,nlength
  CALL DelayFor100ths
  
  ;Stop playing
  IN AL,61h
  AND AL,11111100b
  OUT 61h,AL
 
 RET
 playNote ENDP
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   ;Play the note A for 1 sec
   MOV note,440
   MOV nlength,100
   CALL playNote
   
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