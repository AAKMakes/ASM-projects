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
include CONIO.INC      ; Required in order to use various I/O functions.
;End of includes
 ; Prompts the user for a number and stores it in AX.
    PromptForNumber PROC
      MOV AH,2
      MOV DL,'?'
      INT 21h              ; Print '?'.

      CALL InputDecWord    ; Input a number into AX.
	  RET
    PromptForNumber ENDP
    
    ; Prints '!' and two spaces.
    Emphasis PROC
      MOV AH,2
      MOV DL,'!'
      INT 21h              ; Print '!'.
      MOV DL,' '
      INT 21h              ; Print ' '.
      INT 21h              ; Print ' '.
      RET
    Emphasis ENDP

 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   CALL PromptForNumber
      MOV BX,AX            ; Prompt the user for a number and store it to BX.

      MOV CX,3
     Cheer:
      MOV DX,BX
	  PUSH BX
      CALL PrintDecWord    ; Print the number the user entered.
      CALL Emphasis        ; Print "!  ".
	  POP BX
      LOOP Cheer           ; Repeat 3 times.

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