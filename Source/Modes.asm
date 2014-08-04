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

   MOV AH,9
   LEA DX,numPrompt
   INT 21h						;Prompt the user to enter a number.
   
   CALL InputDecByte				;Input the number into AX.
    MOV AH,0			;Set AH to the ID of the set-video-mode function.
	INT 10h			;Call the Video-Service interrupt, which sets the video mode.

	MOV AH,0			;Set AH to the ID of the set-video-mode function.
	MOV AL,03h			;Set AL to the new video mode to apply.
	INT 10h			;Call the Video-Service interrupt, which sets the video mode.

	MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
   
   Main ENDP

MyCode endS
End Start