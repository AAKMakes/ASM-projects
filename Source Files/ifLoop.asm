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
  counter DB 1
  min DB 0
  max DB 0
  sum DB 0
  prompt1 DB "Min>$"
  prompt2 DB "Max>$"
  prompt3 DB "Enter a number, 0 to stop>$"
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
   MOV counter,1
   countTenLoop:
    CMP counter,10
	JG endTenCount
	MOV DL,counter
	CALL PrintDecByte
	Call PrintNewLine
	INC counter
	JMP countTenLoop
   endTenCount:
   MOV CX,10
   countDown:
    MOV DX,CX
	CALL PrintDecWord
	CALL PrintNewLine
	LOOP countDown
   endCountDown:
   
   ;Min and max comparing
   ;Ask for min
   MOV AH,9
   LEA DX,prompt1
   INT 21h
   ;Get min
   CALL InputDecByte
   MOV min,AL
   ;Ask for max
   MOV AH,9
   LEA DX,prompt2
   INT 21h
   ;Get max
   CALL InputDecByte
   MOV max,AL
   LoopNums:
    MOV BH,max
    CMP min,BH
	JG EndLoopNums
	MOV DL,min
	CALL PrintDecByte
	CALL PrintNewLine
	INC min
	JMP LoopNums
   EndLoopNums:
   
   ;Sums exersize
   
   SumNums:
    MOV AH,9
	LEA DX,prompt3
	INT 21h
	CALL InputDecByte
	CMP AL,0
	JE EndSums
	ADD sum,AL
	JMP SumNums
   EndSums:
	MOV DL,sum
	CALL PrintDecByte
   
   
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