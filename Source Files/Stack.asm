;
; ASM -- National Computer Camps
;
; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
 numPrompt DB "Type a number: ","$"
  youTypedMsg DB "Answer: ","$"

 
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
   LEA DX,numPrompt
   INT 21h						;Prompt the user to enter a number.
   
   CALL InputDecWord				;Input the number into AX.
   MOV BX,AX					;Set DX = AX (the inputted number).
   
   MOV AH,9
   LEA DX,numPrompt
   INT 21h						;Prompt the user to enter a number.
   
   CALL InputDecWord				;Input the number into AX.
   MOV CX,AX					;Set DX = AX (the inputted number).
   
   PUSH BX						;Save DX’s value (the inputted number) on the stack.
    PUSH CX
	MOV AH,9					;Set AH = ID of print-string function (clobbers AX).
    LEA DX,youTypedMsg
    INT 21h						;Print "You typed "…
   POP CX						;Restore DX to its old value (the inputted number).
   POP BX
   MOV DX, CX
   SUB DX, BX
   CALL PrintDecWord				;Print the number in DX.
   
   ;MOV DX, BX

   ;CALL PrintDecWord
   
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start