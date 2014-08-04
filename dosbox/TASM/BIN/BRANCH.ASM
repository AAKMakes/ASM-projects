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
  howOldMsg DB "How old are you? ","$"
  cannotVote DB "You cannot vote.$"
  canVote DB "You can vote.$"
  kid DB "You are a kid.$"
  teen DB "You are a teenager.$"
  adult DB "You are an adult.$"

MyData endS



MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
include CONIO.INC
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
   
   MOV AH,9
   LEA DX,howOldMsg
   INT 21h
   
   CALL InputDecByte
   MOV BL,AL
   CMP BL,18
   JGE canVoteCode
   JMP cannotVoteCode
   
   canVoteCode:
    MOV AH,9
	LEA DX,canVote
	INT 21h
	JMP Exersize2
   cannotVoteCode:
    MOV AH,9
	LEA DX,cannotVote
	INT 21h
	JMP Exersize2
   
   Exersize2:
    CMP BL,13
	JL kidCode
	CMP BL,19
	JG adultCode
	JMP teenCode
   kidCode:
    MOV AH,9
	LEA DX,kid
	INT 21h
	JMP Exit
   teenCode:
    MOV AH,9
	LEA DX,teen
	INT 21h
	JMP Exit
   adultCode:
    MOV AH,9
	LEA DX,adult
	INT 21h
	JMP Exit
   
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