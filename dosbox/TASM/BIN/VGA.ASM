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
   
   ;Enter VGA
   MOV AH,0
   MOV AL,13h
   INT 10h
   
   PUSH DS ;Save DS
   
   MOV AX,0A000h
   MOV DS,AX      ;SET DS=$A000
   
   MOV DI,00000h ;set DI=$0000
   MOV CX,320*200 ;CX=numscrlocs
   
   FILLSCRLOOP:
    MOV BYTE PTR [DI],10h
	INC DI
	LOOP FILLSCRLOOP
	
   POP DS
   
   call pause
   
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