;
; Comment
;

; === STACK SEGMENT ===
MyStack segment stack
  DB 64 dup('12345678')
MyStack endS

; === DATA SEGMENT ===
MyData segment
  ; --- Declare your variables here ---
  helloMsg DB "Hello World","$"
MyData endS


MyCode segment
 Assume CS:Mycode,DS:MyData
;Includes go here
include CONIO.INC      ; Required in order to use the Pause function.
;End of includes
 Main PROC
  Start:
   MOV AX, MYDATA
   MOV DS, AX
   ;Start of your code
         MOV AH,0Fh
      INT 10h              ; Save the initial screen mode (probably 03h) in AL.

      PUSH AX              ; Save AL.
       MOV AH,0
       MOV AL,13h
       INT 10h             ; Change the screen mode to 13h (the VGA Screen).
      ;POP AX               ; Restore AL.
      
      MOV AH,9
      LEA DX,helloMsg
      INT 21h              ; Print "Hello World".
      
      CALL Pause           ; Wait for the user to press a key.
      POP AX
      MOV AH,0
      ; AL = the original
      ;      screen mode
	  
      INT 10h              ; Restore the original screen mode.
    

   ;End of your code.
   ;XOR AX,AX
   ;XOR BX,BX
   ;XOR CX,CX
   ;XOR DX,DX
   MOV AH, 4Ch
   XOR AL, AL
   INT 21h
  Main ENDP
 MyCode endS
 End Start