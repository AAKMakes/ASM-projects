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
  scrscr DB "ScreenScrew for DOS, V 1.0.",13,10,"Press a key to screw with screen!$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
INCLUDE CONIO.INC
INCLUDE TIME.INC
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AH,9
   LEA DX,scrscr
   INT 21h
   
   CALL PAUSE
   
   ;clear screen
   MOV AH,0
   MOV AL,13h
   INT 10h
   
   MOV AH,0
   MOV AL,03h
   INT 10h
   
   PUSH DS
   
   MOV AX,0B800h
   MOV DS,AX
   
   MOV DI,00000h
   MOV CX,80*25
   XOR BX,BX
   FillScreenLoop:
    INC BH
	INC BL
	MOV BYTE PTR [DI],BL
	INC DI
	MOV BYTE PTR [DI],BH
	INC DI
	MOV AX,1
	CALL DelayFor100ths
	LOOP FillScreenLoop
    
	
   
   CALL PAUSE
   
   ;clear screen
   MOV AH,0
   MOV AL,13h
   INT 10h
   
    
   MOV AH,0
   MOV AL,03h
   INT 10h
   MOV DI,00000h
   XOR AX,AX
   XOR BX,BX
   XOR CX,CX
   XOR DX,DX
   MOV CX,40*25
   XOR BX,BX
   MOV BL,'A'
   MOV DL,'a'
   FillScreenLoop2:
    
	MOV BYTE PTR [DI],BL
	INC DI
	MOV BYTE PTR [DI],BH
	INC DI
	MOV BYTE PTR [DI],DL
	INC DI
	MOV BYTE PTR [DI],BH
	INC DI
	INC BH
	INC BL
	INC DL
	MOV AX,1
	CALL DelayFor100ths
	CMP BH,11110000b
	JE FIX2
	CMP BL,'Z'+1
	JE FIX
	
	LOOP FillScreenLoop2
   JMP EXIT
   FIX:
   MOV BL,'A'
   MOV DL,'a'
   JMP FillScreenLoop2
   FIX2:
   XOR BH,BH
   JMP FIllScreenLoop2
   EXIT:
   CALL PAUSE
   
   ;clear screen
   MOV AH,0
   MOV AL,13h
   INT 10h
   
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