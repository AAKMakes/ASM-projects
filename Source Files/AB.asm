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
 
 ; === PROCEDURES ===
 
 Main PROC                                      ; Main procedure
  Start:                                        
   MOV AX, MyData                               ; Setup data segment;
   MOV DS, AX                                   ;   mucho importante!
  
   ; --- Insert your program's initial code here ---
  MOV AH,2			;Set AH to the ID of the DOS-Service print-character function.
  MOV DL,'A'			;Set DL to the ASCII code of the character to print.
  INT 21h			;Call the DOS-Service interrupt, which prints the character.
  
  MOV AH,2			;Set AH to the ID of the DOS-Service print-character function.
  MOV DL,13			;Set DL to the ASCII code of a carriage-return (13).
  INT 21h			;Call the DOS-Service interrupt-vector, which prints the character.
  
  MOV AH,2			;Set AH to the ID of the DOS-Service print-character function.
  MOV DL,10			;Set DL to the ASCII code of a carriage-return (13).
  INT 21h			;Call the DOS-Service interrupt-vector, which prints the character.
 
  MOV AH,2			;Set AH to the ID of the DOS-Service print-character function.
  MOV DL,'B'			;Set DL to the ASCII code of the character to print.
  INT 21h			;Call the DOS-Service interrupt, which prints the character.

   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
