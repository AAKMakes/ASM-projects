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
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   MOV AH,08h
   INT 21h
   
   
   
   MOV DL,AL
   MOV BL,AL
   CALL PrintHexByte
   
   CMP AL,0
   JGE TypedStandardCode
   
   TypedExtendedCode:
   MOV AH,21h
   MOV DL,'+'
   INT 21h
   
   MOV AH,08h
   INT 21h
   MOV DL,AL
   CALL PrintHexByte
   
   TypedStandardCode:
    MOV AH,21h
	MOV DL,'h'
	INT 21h
	CALL PrintNewLine
	CMP BL,0Dh
	JE Exit
	JNE Start
	Exit:
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