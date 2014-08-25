; This is a comment
; My first Assembler Program

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
	; --- Declaring Varibles Here ---
	helloMsg DB "Hello World$"
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === DIRECTIVES ===
	
	; === PROCEDURES ===
	Main PROC ; MAIN Procedure
		Start:
			MOV AX, MyData
			MOV DS, AX 
			
			; --- INITAL CODE HERE ---
			
			; Printing "Hello World" to the screen
			MOV AH,9 ; DOS-Service: Print String DX
			LEA DX,helloMsg ; DX -> helloMsg
			INT 21h ; Invoke the DOS service
			
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
MyCode endS
End Start 