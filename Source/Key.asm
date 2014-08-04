;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
 
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
   MOV DS, AX                                   ;   mucho importante!
  
 MOV AH,08h
   INT 21h						;Wait for the user to type a character.
   							;If the user typed a standard character,
								;then AL equals the standard code of the character.
							;If the user typed an extended character, then AL equals 0.
   MOV DL,AL
   CALL PrintHexByte				;Print AL (in hexadecimal), which is either the standard code
   								;of the typed character or 0.
   CMP AL,0
   JNE TypedStandardCode			;Test what kind of character was typed by testing 
  								;whether AL is 0.
  TypedExtendedCode:
   MOV AH,2
   MOV DL,'+'					;Print +.
   INT 21h

   MOV AH,08h
   INT 21h						;AL is now the extended code of the typed character.

   MOV DL,AL
   CALL PrintHexByte				;Print AL (in hexadecimal), which is the extended code
   								;of the typed character.
  TypedStandardCode:
   MOV AH,2
   MOV DL,'h'					;Print h.
   INT 21h

  
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
