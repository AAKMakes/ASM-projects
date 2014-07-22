;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
numPrompt DB "Type a mode: ","$"

MyData endS

; === CODE SEGMENT ===
MyCode segment                                  ; Sets up the segment names for
 Assume CS:MyCode,DS:MyData                     ;   the code and data segments.
 
 ; === INCLUDE DIRECTIVES ===
 include CONIO.INC
 ; === PROCEDURES ===
 
   Main PROC                                      ; Main procedure
   Start:    
   MOV AX, MyData                               ; Setup data segment;
   MOV DS, AX 

   MOV AH,0
      MOV AL,13h					;Change the screen mode to 13h (the VGA screen).
      INT 10h
      
      PUSH DS					;Save the data segment’s offset (DS’s initial value).

       MOV AX,0A000h
 MOV DS,AX					;Set DS = $A000.

   	 MOV DI,00000h				;Set DI = $0000.
   	 MOV CX,320*200				;Set CX = number of locations onscreen
     MOV BX, 0
	 MOV AX, 0
FillScreen:
	 CMP CX, AX
	 JGE FillScreenEnd
	 MOV WORD PTR [DI],BX			;Set color current location (DS:DI) to 1 (blue).
     INC DI					;Move to the next location (DI += 1).
	 INC BX
	 INC AX
	 CMP BX, 160
	 JGE Re
	 JL FillScreen
Re: 
    MOV BX, 0
	JMP FillScreen
FillScreenEnd:
    
	 
     			;Keep looping until all locations are traversed.
     
   	 POP DS					;Restore the data segment’s offset to DS.

      CALL Pause					;Use Pause to wait for the user to press a key.

      MOV AH,0
      MOV AL,03h					;Restore the screen mode to 03h (the text screen).
      INT 10h


	MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
   
   Main ENDP

MyCode endS
End Start