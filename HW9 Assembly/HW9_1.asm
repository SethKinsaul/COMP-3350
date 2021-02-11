; HW9_1.asm - Created by Seth Kinsaul
; This program passes an array offset and array length to a procedure that then fills it with the Geometric sequence

INCLUDE Irvine32.inc
GeometricProgression PROTO, ptrArrayB:PTR BYTE, ArrayBSize:BYTE

.data
ArrayB BYTE 8 DUP(0)
ArraySize BYTE 8
welcomeMsg BYTE "Hello! This program passes an array offset and array length to a procedure that then fills it with the Geometric sequence.", 0
initialArray BYTE "The initial array values are: ", 0
finalArray BYTE "These are the inserted geometric values in the array that would be placed in the denominator of the gemotric sequence(1/2, 1/4, 1/8, 1/16, 1/32, 1/64, 1/128): ", 0

.code
main PROC
	mov edx, OFFSET welcomeMsg
	call WriteString                            ; prints welcome message to screen
	call crlf                                   ; formatting
	call crlf                                   ; formatting
	mov edx, OFFSET initialArray
	call WriteString                            ; prints message indicating initial array values will be printed
	call crlf                                   ; formatting

	mov eax, 0                                  ; clear eax
	mov esi, 0                                  ; set esi to 0
	mov ecx, (LENGTHOF ArrayB)                  ; set loop counter to length of array (10)
	L1:
		mov al, ArrayB[esi]                     ; move array value to al
		call WriteInt                           ; print value in al
		call crlf                               ; formatting
		inc esi                                 ; esi = esi + 1 (points to next value in array)
		loop L1                                 ; loop

	invoke GeometricProgression, ADDR ArrayB, ArraySize  ; calls the ArraySeries procedure

	call crlf                                   ; formatting
	mov edx, OFFSET finalArray
	call WriteString                            ; prints message indicating final array values will be printed
	call crlf                                   ; formatting

	mov esi, 0                                  ; reset esi to 0
	mov ecx, LENGTHOF ArrayB                    ; set loop counter to length of array (10)
	L2:
		mov al, ArrayB[esi]                     ; move array value to al
		call WriteInt                           ; print value in al
		call crlf                               ; formatting
		inc esi                                 ; esi = esi + 1 (points to next value in array)
		loop L2                                 ; loop

	exit
main ENDP

; Geometric Progression
; Fills an array with the Geometric series of numbers                                  
; Receives: ADDR ArrayB = OFFSET of ArrayB                                               
;           ArraySize = Size of ArrayB (8)                                              
; Returns:  ax = Just to end procedure                            

GeometricProgression PROC, ptrArrayB:PTR BYTE, ArrayBSize:BYTE
	mov esi, ptrArrayB                               ; move byte pointer to esi
	mov eax, 1                                       ; move first value (0.5) to eax
	mov [esi], eax                                   ; set first value in array to 0.5
	inc esi                                          ; esi = esi + 1 (points to next value in array)
	mov eax, 2
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	inc esi											 ; set loop counter to remaining length of array (8)
	mov eax, 4
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	inc esi
	mov eax, 8
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	inc esi
	mov eax, 16
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	inc esi
	mov eax, 32
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	inc esi
	mov eax, 64
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	inc esi
	mov eax, 128
	mov [esi], eax									 ; set second value in array to 0.25 by dividing by 2
	ret                                                ; return to where this procedure was invoked
GeometricProgression ENDP
END main