; New Line Assembly Program

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	firstLine DB "123 Main Street$"
	secondLine DB "Orangetown, New York$"
	thirdLine DB "12345$"
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
			
			; Print Line One
			MOV AH,9
			LEA DX,firstLine
			INT 21h
			
			; Print new line
			MOV AH,2
			MOV DL,10
			INT 21h
			
			; Print Line Two
			MOV AH,9
			LEA DX,secondLine
			INT 21h
			
			; Print new line
			MOV AH,2
			MOV DL,10
			INT 21h
			
			; Print Line Three
			MOV AH,9
			LEA DX,thirdLine
			INT 21h
			
			; Print a Char
			
			MOV AH,2
			MOV DL, 'A'
			INT 21h
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
MyCode endS
End Start