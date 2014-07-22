; ASM -- National Computer Camps 2013
; Sample Code for instruction written by Michael Curry in 2012
; Color Assembly Program | Note: This is probably the most difficult ASM program to figure out 

; === STACK SEGMENT ===
MyStack segment stack
	DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData Segment
	; --- Declare Varibles here ---
	color DB ?		; New color var, ? sets undeclared value (Note: this var was taken out in a later version)
MyData endS

; === CODE SEGMENT ===
MyCode segment
	Assume CS:MyCode,DS:MyData
	
	; === INCLUDE DIRECTIVES ===
	include CONIO.INC
	include TIME.INC
	; === PROCEDURES ===
	
	Main PROC
		Start:
			MOV AH,0
			MOV AL,13h		; This starts the IBM screen graphics mode (320x200 color resolution)
			INT 10h
			
			PUSH DS		; Protect the Data Segment (since we changing it to )
			
				MOV AX,0A000h	; now we are entering PutPixel mode
				MOV DS,AX		; make sure you already pushed the Data Segment onto the stack!
				
				MOV DI,00000h	; This is the absolute pixel location (asm treats the screen as 64k pixel locations)
				MOV CX,200		; This will keep track of horizontal resolution (rows)
				MOV DX,0		; Clear the current vertical res. before loop (set first column)
				FillScreenLoop:
								; *This is the more efficent pixel-by-pixel screen fill method*
					MOV BL,0	; This will hold the color code
					MOV DX,0	; The DX register keeps track of the vertical pixel location (column)
					
					inloop:
						CMP DX,319		; check to see if we're done with the current resoltion line
						JG endloop		; if we are then exit the loop and go to next row
						
						MOV AL,BL		; load color code value into AL
						MOV BYTE PTR [DI], AL	; sets pixel DI to color value AL
						INC DI			; increase the asbolute pixel location
						INC BL			; increase to the next color value
						INC DX			; increase the vertical pixel location
						MOV AX,1
						
						JMP inloop		; go back to start of the loop
						
					endloop:	; invoked when we need to go to the next row of resolution
					DEC CX		; Decrease the number of rows we have yet to fill
					CALL DelayFor100ths
					CMP CX,0	; if we have reached the last row
					JNE FillScreenLoop	; if we haven't reached the last row keep going
					
			POP DS	; recover the Data Segment
			CALL Pause	; let's you admire your beautiful color-filled screen, part of CONIO.INC
			
			MOV AH,0 
			MOV AL,03h	; this kills the IBM graphics screen and returns to the ASCII text screen
			INT 10h
			; ***Closing program and returning to DOS***
			MOV AH, 4Ch
			XOR AL, AL
			INT 21h
		Main ENDP
		
MyCode endS
End Start