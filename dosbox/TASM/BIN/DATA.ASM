;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
prompt DB "Which letter? (0-25): ","$"
alphabet DB "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

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
      LEA DX,DS:prompt             ; Let DS:DX = offset of "prompt" within DS.
INT 21h                      ; Prompt the user for the number of a letter.
	CALL InputDecWord            ; Input number (1-26) into AX.
   ADD AX, 1
MOV CX,AX                    
DEC CX                       ; CX = offset of letter within "alphabet" (0-25)
	
ADD CX,OFFSET DS:alphabet    ; CX += offset of "alphabet" within DS

MOV SI,CX                    ; DI = offset to letter within DS
	MOV BL,[SI]                  ; BL = value of letter (byte at DS:DI)
	
MOV AH,2
      MOV DL,BL
INT 21h                      ; Print BL (value of letter).

   
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP

MyCode endS
End Start