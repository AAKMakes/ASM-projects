;
; Comment
;This is my final assembly program.
;Primary purpose: show the world that I know assembly
;Secondary purpose: make a matrix simulator
;Tertiary purpose: as a final project for NCC

; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
  buffer DB " ABCDEFGHIJKLMNOPQRSTUVWXY"
  rabbit DB "Press a key to follow the white rabbit...$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
INCLUDE TIME.INC
INCLUDE CONIO.INC
INCLUDE SOUND.INC
;INCLUDE RANDOM.ASM
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   MOV AH,9
   LEA DX,rabbit
   INT 21h
   CALL PAUSE
   ;Enter the IBM mode
   PUSH DS
   MOV AX,0B800h
   MOV DS,AX
   XOR AX,AX
   
   MOV DI,00000h
   
   MOV AL,0
   MOV CX,80*25
   FillScreenLoop:
   MOV BYTE PTR [DI],AL
   INC AL
   INC DI
   MOV BYTE PTR [DI],10
   INC DI
   PUSH AX
   MOV AX,1
   
   POP AX
   LOOP FillScreenLoop
 
   ; MOV DI,4000
   

   ; MOV CX,50
   ; XOR DX,DX
   ; MOVLINES:
   ; MOV AL,BYTE PTR [DI]
   ; MOV SI,DS
   ; POP DS
   ; MOV BX,DI
   ; LEA DI,buffer
   ; ADD DI,DX
   ; MOV BYTE PTR [DI],AL
   ; PUSH DS
   ; MOV DS,SI
   ; MOV DI,BX
   ; INC DX
   ; INC DI
   ; INC DI
   ; LOOP MOVLINES
   XOR BX,BX
   MOV BX,20
   JMP gohere
   INCBX:
   MOV BX,20
   gohere:
   CMP BX,20
   JL INCBX
   CALL ToneFreq
   MOV DI,4000
   MOV CX,4000
   INC BX
   MatrixAll:
   MOV AL,BYTE PTR [DI]
   MOV BYTE PTR [DI]+160,AL
   DEC DI
   DEC DI
   CALL ToneOn
   
   LOOP MatrixAll
      MOV DI,0
      
   MOV CX,80
   POP AX
   FillScreenLoop2:
   MOV BYTE PTR [DI],AL
   INC AL
   INC DI
   MOV BYTE PTR [DI],10
   INC DI
   PUSH AX
   MOV AX,1
   POP AX
   LOOP FillScreenLoop2
   PUSH AX
   MOV AX,1
   CALL DelayFor100ths
   JMP gohere
   ; MOV DI,0
   ; XOR DX,DX
   ; MOV CX,50
   ; RESTORELINES:
   
   ; MOV SI,DS
   ; POP DS
   ; MOV BX,DI
   ; LEA DI,buffer
   ; ADD DI,DX
   ; MOV AL,BYTE PTR [DI]
   ; PUSH DS
   ; MOV DS,SI
   ; MOV DI,BX
   ; MOV AL,BYTE PTR [DI]
   ; INC DX
   ; INC DI
   ; INC DI
   ; LOOP RESTORELINES
   
   CALL PAUSE
   POP DS
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