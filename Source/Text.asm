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
   
 PUSH DS					;Save the data segment’s offset (DS’s initial value).

  MOV AX,0B800h
 MOV DS,AX					;Set DS = $B800.

 MOV DI,00000h				;Set DI = $0000.
 MOV CX,80*25				;Set CX = number of locations onscreen
;(# of columns times # of rows).
FillScreenLoop:
	 MOV BYTE PTR [DI],1			;Set ASCII value of current location (DS:DI) to '!'.
	 INC DI
	 INC DI
                           ;Move to the next location (DI += 2).
 LOOP FillScreenLoop			;Keep looping until all locations are traversed.

POP DS				

   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP

MyCode endS
End Start