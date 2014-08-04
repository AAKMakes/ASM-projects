;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  howOldMsg DB "How old are you? ","$"
  equalAgeMsg DB "You're an Adult .","$"
  youngerAgeMsg DB "You're a Kid.","$"
  olderAgeMsg DB "You're a Teenager .","$"
 
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
   
   MOV AH,9						
   LEA DX,howOldMsg				;Ask for the user’s age.
   INT 21h
   
   CALL InputDecByte				;Input the age into AL.
   ; AL = user's age

   CMP AL,13					;Compare AL with 14.
   JL Kid					;If AL < 14 then jump to the kid label.
   JG Teenager 					;Otherwise  AL = 14, so jump to the EqualAge label.
  
  Kid:					;=== kid label ===
   MOV AH,9
   LEA DX,youngerAgeMsg				;Print that the user is younger than 14.
   INT 21h
   JMP Exit						;Jump to the Exit label
  
  Teenager :
   CMP AL,19
   JG Adult  ;=== teenager  label ===
   MOV AH,9
   LEA DX,olderAgeMsg				;Print that the user is older than 14.
   INT 21h
   JMP Exit						;Jump to the Exit label
  
  Adult :						;=== EqualAge label ===
   MOV AH,9
   LEA DX,equalAgeMsg				;Print that the user is 14.
   INT 21h
   ; implied: JMP Exit				;Since the next line is the Exit label, 
                                	;we don’t need to jump to it explicitly.
Exit:
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
