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
  SCRMODES DB "Screen modes: ",13,10,"1. 640x200, 256 colors:",13,10,"2. 320x200 16 colors",13,10,"3. monochrome text",13,10,">$"
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
   
   MOV AH,9
   LEA DX,SCRMODES
   INT 21h
   
   CALL InputDecByte
   MOV BL,DL
   
   CMP BL,1
   JE highcol
   CMP BL,2
   JE midcol
   jmp lowcol
   
   highcol:
   MOV AH,0
   MOV AL,13h
   INT 10h
   midcol:
   MOV AH,0
   MOV AL,0Dh
   INT 10h
   lowcol:
   MOV AH,0
   MOV AL,13h
   INT 07h
   
   MOV CX,9999
   LOOPSEC:
   MOV AH,2
   MOV DX,0
   INT 21h
   LOOP LOOPSEC
   ENDLOOP:
   MOV AH,0
   MOV AL,13h
   INT 10h
   MOV AH,0
   MOV AL,03h
   INT 10h
   
   MOV AH,0
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