; HW8num2b.asm - Created by Seth Kinsaul
; Description: This program takes the value 1234ABCDh and groups it into sets of 2 hexadecimal integers. The sets will be added into DH and DL, with 2 sets in each one. 
;              For example, 12h and 34h will be added into DH, and ABh and CDh will be added into DL.

INCLUDE Irvine32.inc

.data
WelcomeMSG BYTE "Welcome! This program takes the value 1234ABCDh and stores the first 2 decimal numbers in dh, and also stores the last 2 decimal numbers in dl.", 0
dhValPrompt BYTE "DH has the decimal value: ", 0
dlValPrompt BYTE "DL has the decimal value: ", 0
dhVal WORD ?
dlVal WORD ?

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString              ; display welcome message
	call crlf                     ; formatting
	call crlf                     ; formatting
	mov eax, 01234ABCDh           ; initial value (eax = 0001 0010 0011 0100 1010 1011 1100 1101)
	mov edx, 0                    ; clear edx

	and al, 00001100b             ; eax = 0001 0010 0011 0100 1010 1011 0000 1101
	and ah, 11110000b             ; eax = 0001 0010 0011 0100 1010 0000 0000 1101
	ror al, 4                     ; eax = 0001 0010 0011 0100 1010 0000 1101 0000
	ror ah, 4                     ; eax = 0001 0010 0011 0100 0000 1010 1101 0000
	ror ax, 4                     ; eax = 0001 0010 0011 0100 0000 0000 1010 1101
	shr ax, 1                     
	mov dlVal, ax               
	shl al, 1                     
	and ax, 00001111b             
	add dlVal, ax               

	and al, 00000000b             ; clear ax
	shr eax, 16                   ; eax = 0000 0000 0000 0000 0001 0010 0011 0100
	and al, 11110000b             ; eax = 0000 0000 0000 0000 0001 0010 0011 0000
	and ah, 00001111b             ; eax = 0000 0000 0000 0000 0000 0010 0011 0000
	ror ax, 4                     ; eax = 0000 0000 0000 0000 0000 0000 0010 0011
	and ax, 00001111b             ; eax = 0000 0000 0000 0000 0000 0000 0000 0011
	mov dhVal, ax               
	and ax, 00000000b             ; eax = 0000 0000 0000 0000 0000 0000 0000 0000
	or ax, 01000110b              ; eax = 0000 0000 0000 0000 0000 0000 0100 0110
	add dhVal, ax               

	mov edx, OFFSET dhValPrompt 
	call WriteString              ; prompt user that dh value will be displayed
	
	movzx eax, dhVal              ; zero-extend dhVal to eax for display
	call WriteInt                 ; display dh value
	call crlf                     ; formatting
	
	mov edx, OFFSET dlValPrompt
	call WriteString              ; prompt user that dl value will be displayed
	
	movzx eax, dlVal            ; zero-extend dlVal to eax for display
	call WriteInt                 ; display dl value
	call crlf                     ; formatting

	exit
main ENDP
END main