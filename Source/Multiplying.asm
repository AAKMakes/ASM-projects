;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  numPrompt1 DB "Number?","$"
  numPrompt2 DB "Number?","$"
  num1 DB "123456789"
  num2 DB "123456789"
  ;minus DB " minus ","$"
  ;equals DB " equals ","$"
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
   MOV DS, AX 
   
   MOV AH,9
   LEA DX,numPrompt1				;Print "Number? ".
   INT 21h

   CALL InputDecByte
   MOV CL, AL
   
   MOV AH,9
   LEA DX,numPrompt2				;Print "Number? ".
   INT 21h

  
   CALL InputDecByte
   MOV BL, AL
   
   ;MOV AX, CX
   ;CALL PrintDecWord
  
   ;MOV AH,9
   ;LEA DX,minus				;Print "Hello ".
   ;INT 21h
   
   ;MOV DX, BX
   ;CALL PrintDecWord
   
   ;MOV AH,9
   ;LEA DX,equals				;Print "Hello ".
   ;INT 21h
   
   
   MUL CL
   
   MOV DX, AX
   CALL PrintDecWord

   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
