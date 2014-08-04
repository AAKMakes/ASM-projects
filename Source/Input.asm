; Console Input Assembly Program

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	inputBuffer DB "1234567890123456"
	inputBufferTwo DB "1234567890123456"
	firstPrompt DB "What is your first name? ","$"
	secondPrompt DB "What is your last name? ","$"
	helloMsg DB "Hello ","$"
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
			
			; Print the Prompt
			MOV AH,9
			LEA DX,firstPrompt
			INT 21h
			
			MOV AH,16 				; Set AH to size of buffer
			LEA DX,inputBuffer		; Set DX to buffer address
			CALL InputStr			; Get input
			
			; Print the 2nd Prompt
			MOV AH,9
			LEA DX,secondPrompt
			INT 21h
			
			MOV AH,16 				; Set AH to size of buffer
			LEA DX,inputBufferTwo	; Set DX to buffer address
			CALL InputStr			; Get input
			
			; Print "Hello "
			MOV AH,9
			LEA DX,helloMsg
			INT 21h
			
			; Print the input buffer
			MOV AH,9
			LEA DX,inputBuffer
			INT 21h
			
			; Print a space
			MOV AH,2
			MOV DL, ' '
			INT 21h
			
			; Print the 2nd input buffer
			MOV AH,9
			LEA DX,inputBufferTwo
			INT 21h
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
MyCode endS
End Start