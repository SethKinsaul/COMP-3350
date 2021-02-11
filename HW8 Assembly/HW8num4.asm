; HW8num4.asm - Created by Seth Kinsaul
; This program will have the register ax as its input.  It will display the contents of ax in binary on the screen
; This program uses shifts to achieve this function

INCLUDE Irvine32.inc

.data
PromptUser BYTE "Please enter a value for ax: ", 0
welcomeMSG BYTE "Hello, This program will have the register ‘AX’ as its input.  It would display the contents of AX in binary on the screen", 0
axInput QWORD ?

.code
main PROC

	mov eax, 0
	mov ebx, 0
	mov edx, OFFSET welcomeMSG
	call WriteString			; display welcome message
	call crlf
	call crlf

	mov edx, OFFSET PromptUser
	call WriteString
	call ReadInt

	exit
main ENDP
END main