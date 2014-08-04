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
 include TIME.INC
 ; === PROCEDURES ===
Main PROC                                      ; Main procedure
  Start:                                        
   MOV AX, MyData                               ; Setup data segment;
   MOV DS, AX                                   ;   mucho importante!
  
   MOV AH,2Ch
   INT 21h

   MOV AH,0
   MOV AL,0					;Set {AH:AL:BH:BL} = {0:0:3:0}, i.e. set {AH:AL:BH:BL} to 3 seconds.
   MOV BH,3
   MOV BL,0
   
   CALL AddTimes				;Add {CH:CL:DH:DL} to {AH:AL:BH:BL} using AddTimes.
  						;{AH:AL:BH:BL} now contains the time at which to stop waiting.
  DelayLoop:					;That is, {AH:AL:BH:BL} is now (the current time + {0:0:3:0}).
   PUSH AX
    MOV AH,2Ch				;Set {CH:CL:DH:DL} = the current system time.
    INT 21h
   POP AX
   
   CALL CmpTimes				;Compare {AH:AL:BH:BL}, the time to stop waiting, with
 							 ;{CH:CL:DH:DL}, the current time, using CmpTimes.
   JG DelayLoop				;Keep waiting while {AH:AL:BH:BL}, the time to stop waiting, is 
   							;greater (later) than {CH:CL:DH:DL}, the current time.

  
   MOV AH, 4Ch                                  ; This section of code
   XOR AL, AL                                   ; closes the program
   INT 21h                                      ; and returns to DOS.
 Main ENDP
 
MyCode endS
End Start
