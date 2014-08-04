;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
 
 
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
   
  Mov AL, 1

   CMP AL,10					;Compare AL with 14.
   JLE Count					;If AL < 14 then jump to the kid label.
   JG Exit 					;Otherwise  AL = 14, so jump to the EqualAge label.
  
  Count:					;=== kid label ===
   MOV DL, AL
   CALL PrintDecByte		;Print that the user is younger than 14.
   ADD AL, 1
   CMP AL,10
   JLE Count
  
  
Exit:
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
