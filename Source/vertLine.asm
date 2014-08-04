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
			MOV AL,13h							; This starts the IBM screen graphics mode (320x200 color resolution)
			INT 10h
			
			PUSH DS								; Protect the Data Segment (since we changing it to )
			
				MOV AX,0A000h					; now we are entering PutPixel mode
				MOV DS,AX						; make sure you already pushed the Data Segment onto the stack!
					
				MOV DI,00000h					; This is the absolute pixel location (asm treats the screen as 64k pixel locations
				MOV DX,0						; Clear the current vertical res. before loop (set first column)
				
				MOV BL,8        				;BL will hold color code. 12 is red, 0 is black.
				MOV DX,0        				;Holds vert. line location
				MOV CX,320
				
				MOVINGLOOP:
					PUSH CX
					MOV DI,DX
					MOV CX,200
					MOV AH,0Bh
					INT 21h
					CMP AL,0
					JE goback
					
					changecol:
					MOV AH,0Bh
					INT 21h
					CMP AL,'a'
					JNE goback
					INC BL
					goback:
					Blank:
						;MOV CX,200      		;200 lines, used for loop
						MOV BYTE PTR [DI], 0	;Color the pixel black
						ADD DI,320				;Change pixels
						LOOP BLANK				;LOOP!
					MOV CX,200
					INC DX
					MOV DI,DX
					LINE:
						;MOV CX,200      		;200 lines, used for loop
						MOV BYTE PTR [DI], BL	;Color the pixel
						ADD DI,320				;Change pixels
						LOOP LINE				;LOOP!

					POP CX
					MOV AX,1
					CALL DelayFor100ths
					LOOP MOVINGLOOP
			POP DS	; recover the Data Segment
			CALL Pause	; let's you admire your beautiful color-filled screen, part of CONIO.INC
			
			JMP blank
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