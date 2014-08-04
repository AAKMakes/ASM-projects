; Registers Assembly Program

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---

MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	include CONIO.INC
	
	; === PROCEDURES ===
	
	Main PROC
		Start:
			MOV AX, MyData
			MOV DS, AX
			
			; --- Inital Code Here ---
			MOV DX,0						; Set DX = 0
			MOV DL,1						; Set DL = 5
			CALL PrintDecWord				; Display DX in decimal
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
MyCode endS
End Start