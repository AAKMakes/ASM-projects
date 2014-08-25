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
  printme DB "NATIONAL",0Ah,"COMPUTER",0Ah,"CAMP",13,10,07h,"$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here

;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AH,9
   LEA DX,printme
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