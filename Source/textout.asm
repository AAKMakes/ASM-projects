; Textual Output Assembly Program

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	stringToPrint DB "Rick Astley$"
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
			MOV AH,9
			LEA DX,stringToPrint
			INT 21h
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
MyCode endS
End Start