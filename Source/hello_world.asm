;							A semicolon is used to begin a comment. 
; ASM -- National Computer Camps		Comments are ignored by assembler and are helpful 
;							to the reader of the program.

; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
  helloMsg DB "Hello World$"
MyData endS

; === CODE SEGMENT ===
MyCode segment
 Assume CS:MyCode,DS:MyData
 
 ; === INCLUDE DIRECTIVES ===
 
 ; === PROCEDURES ===
 
 Main PROC
  Start:                                        
   MOV AX, MyData
   MOV DS, AX
  
   ; --- Insert your program's initial code here ---
   
   ; Print "Hello World" to the screen
   MOV AH,9
   LEA DX,helloMsg
   INT 21h
  
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
 Main ENDP
 
MyCode endS
End Start