; Console Input Assembly Program

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	inputBuffer DB "000"
	firstPrompt DB "Enter the first number to add: ","$"
	secondPrompt DB "Enter the second number to add: ","$"
	helloMsg DB "The sum of the two numbers is ","$"
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
			
			
			CALL InputDecByte		; Get input store to AL
			MOV BL,AL 				; Move AL to BL to free AL
			
			; Print second prompt
			MOV AH,9
			LEA DX,secondPrompt
			INT 21h
			
			CALL InputDecByte 		; Take new input into AL
			
			; Add the numbers into AL
			ADD AL,BL
			
			; Print "The sum is "
			MOV AH,9
			LEA DX,helloMsg
			INT 21h
			
			; Print the sum 
			MOV DL,AL
			CALL PrintDecByte
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
MyCode endS
End Start