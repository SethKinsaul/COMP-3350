; HW9_2.asm - Created by Seth Kinsaul
; This program reverses an array of BCD numbers containing my student ID, then subtracts myAuburnIdRev from myAuburnId using BCD arithmetic.

INCLUDE Irvine32.inc

.data
myAuburnIdRev BYTE 5 DUP(0)
myAuburnId BYTE 09h, 03h, 75h, 70h, 01h
IdSize = ($ - myAuburnId)
result BYTE IdSize DUP(0)
welcomeMsg BYTE "Hello! This program reverses an array of BCD numbers containing my student ID (903757001), then subtracts myAuburnIdRev from myAuburnId using BCD arithmetic", 0
initialDump BYTE "Current values in memory before any operations:", 0
initialIdDump BYTE "Current values in memory for the myAuburnId array:", 0
afterReverseDump BYTE "Current values in memory for the myAuburnIdRev array after reversing student ID:", 0
afterSubtractionDump BYTE "Current values in memory for the result array after performing BCD subtraction on the student ID and the reverse of it:", 0

.code
main PROC
	mov edx, OFFSET welcomeMsg
	call WriteString                  ; display welcome message to screen
	call crlf                         ; formatting
	call crlf                         ; formatting
	mov edx, OFFSET initialDump
	call WriteString                  ; display initial memory values in result (empty)
	call crlf                         ; formatting
	mov esi, OFFSET result
	mov ecx, SIZEOF result
	mov ebx, TYPE result
	call DumpMem                      ; dump memory to screen for result array
	call crlf                         ; formatting
	call crlf                         ; formatting
	
	mov edx, OFFSET initialIdDump
	call WriteString                  ; display initial memory values in myAuburnId
	call crlf                         ; formatting
	mov esi, OFFSET myAuburnId
	mov ecx, SIZEOF myAuburnId
	mov ebx, TYPE myAuburnId
	call DumpMem                      ; dump memory to screen for myAuburnId array
	call crlf                         ; formatting
	call crlf                         ; formatting

	mov eax, 0                        ; reset eax to 0
	mov esi, 0                        ; reset esi to 0
	mov eax, DWORD PTR myAuburnId     
	ror al, 4                         
	mov myAuburnIdRev[esi + 4], al    
	ror ah, 4                         
	mov myAuburnIdRev[esi + 3], ah    
	shr eax, 16                       
	ror al, 4                         
	mov myAuburnIdRev[esi + 2], al    
	ror ah, 4                         
	mov myAuburnIdRev[esi + 1], ah    
	mov eax, 0                        
	mov al, myAuburnId[esi + 4]       
	ror al, 4                         
	mov myAuburnIdRev[esi], al        ; myAuburnIdRev = 10 07 57 30 90

	mov edx, OFFSET afterReverseDump
	call WriteString                  ; display memory values in myAuburnIdRev
	call crlf                         ; formatting
	mov esi, OFFSET myAuburnIdRev
	mov ecx, SIZEOF myAuburnIdRev
	mov ebx, TYPE myAuburnIdRev
	call DumpMem                      ; dump memory to screen for myAuburnIdRev
	call crlf                         ; formatting
	call crlf                         ; formatting

	mov esi, 4                        ; reset esi to 0
	mov eax, 0                        ; reset eax to 0
	mov ecx, 5                        ; set loop counter to 5
	clc                               ; CF = 0

	L1:
		mov al, myAuburnId[esi]       ; move value in myAuburnId (pointed to by esi) to al
		sub al, myAuburnIdRev[esi]    ; subtract value in myAuburnIdRev (pointed to by esi) to existing value in al
		daa                           ; adjust value in al to BCD format
		mov result[esi], al           ; move al value to value in result (pointed to by esi)
		dec esi                       ; esi = esi + 1 (points to next value in array)
		loop L1                       ; loop

	mov edx, OFFSET afterSubtractionDump
	call WriteString                  ; display memory values in result after BCD addition was performed
	call crlf                         ; formatting
	mov esi, OFFSET result
	mov ecx, SIZEOF result
	mov ebx, TYPE result
	call DumpMem                      ; dump memory to screen for result array
	call crlf                         ; formatting
	call crlf                         ; formatting
	exit

main ENDP
END main