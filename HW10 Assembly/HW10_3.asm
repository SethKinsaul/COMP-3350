; HW10_3.asm - Created by Seth Kinsaul
; This program accepts 8 coordinate inputs from the user, then displays all of the x coordinate values.

INCLUDE Irvine32.inc
NumPoints = 8

COORD STRUCT
	X SWORD ?                                 
	Y SWORD ? 
	;Z SWORD ?
COORD ENDS

.data
ALIGN WORD
AllPoints COORD NumPoints DUP(<0,0>)
WelcomeMSG BYTE "Hello! This program accepts 8 coordinate inputs from the user, then displays all of the x coordinate values.", 0
promptX BYTE "Please enter an X value: ", 0
promptY BYTE "Please enter a Y value: ", 0
promptZ BYTE "Please enter a Z value: ", 0
showPrompt BYTE "The X values are: ", 0

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString                         ; display welcome message
	call crlf                                ; formatting
	call crlf                                ; formatting

	mov edi, 0                               ; array index
	mov ecx, NumPoints                       ; loop counter
	L1: 
		mov eax, 0                           ; reset eax
		mov edx, OFFSET promptX
		call WriteString                     ; prompt user for x coordinate
		call ReadInt                         ; read input
		mov (COORD PTR AllPoints[edi]).X, ax ; store input in X coordinate value at index edi
		mov edx, OFFSET promptY
		call WriteString                     ; prompt user for y coordinate
		call ReadInt                         ; read input
		mov (COORD PTR AllPoints[edi]).Y, ax ; store input in Y coordinate value at index edi
		mov edx, OFFSET promptZ
		call WriteString                     ; prompt user for x coordinate
		call ReadInt                         ; read input
		;mov (COORD PTR AllPoints[edi]).Z, ax ; store input in X coordinate value at index edi
		add edi, TYPE COORD                  ; set edi to point to next coordinate value
		loop L1                              ; loop

	call crlf                                ; formatting
	call crlf                                ; formatting
	mov edx, OFFSET showPrompt
	call WriteString                         ; prompt informing user that x values will be displayed
	call crlf                                ; formatting
	mov ebx, OFFSET AllPoints                ; set ebx to first value in coordinate array
	mov esi, 0                               ; offset of X value
	mov eax, 0                               ; reset eax
	mov ecx, NumPoints                       ; loop counter
	L2:
		mov ax, [ebx+esi]                    ; move current displaced value into ax
		call WriteInt                        ; display x value to screen
		call crlf                            ; formatting
		add ebx, SIZEOF COORD                ; set ebx to next value in coordinate array
		loop L2                              ; loop
	exit


main ENDP
END main