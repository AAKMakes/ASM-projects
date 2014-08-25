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
  booMSG DB "Boo!",13,10,"$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
INCLUDE TIME.INC
;End of includes
 Sleep PROC
    DelayLoop:
    PUSH AX
	 MOV AH,2CH
	 INT 21h
	POP AX
	
	CALL CmpTimes
	
	JG DelayLoop
	RET
 Sleep ENDP
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AH,2CH
   INT 21h
   
   MOV AH,0
   MOV AL,0
   MOV BH,1
   MOV BL,5
   
   CALL AddTimes
   
   CALL Sleep

   MOV AH,9
   LEA DX,booMSG
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