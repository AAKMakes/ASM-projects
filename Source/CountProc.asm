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
  counter DW 0
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
include CONIO.INC
PrintNumbers PROC
 MOV counter,1
    countTenLoop:
     CMP counter,AX
	 JG endTenCount
	 MOV DX,counter
	 CALL PrintDecWord
	 Call PrintNewLine
	 INC counter
	 JMP countTenLoop
   endTenCount:
   RET
 PrintNumbers EndP
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AX,10
   CALL PrintNumbers
   
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