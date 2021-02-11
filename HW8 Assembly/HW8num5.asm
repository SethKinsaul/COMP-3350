; HW8num5.asm - Created by Seth Kinsaul
; This program Performs C = A + B using extended addition.

INCLUDE Irvine32.inc

.data
Apple QWORD	1111222233334444h 
Berry QWORD	13572468ABCD0000h
Cherry QWORD ?
placeholder WORD 0
welcomeMSG BYTE 'Hello! This program performs C = A + B using extended addition. A has the value 1111222233334444h, and B has the value 13572468ABCD0000h.', 0
FinalP BYTE "C = A + B = 1111222233334444h + 13572468ABCD0000h = ", 0

.code
main PROC
	mov edx, OFFSET welcomeMSG
	call WriteString               ; displays welcome message
	mov dx, 0                      ; clears dx
	mov ax, WORD PTR Apple         ; move 4444h to ax
	mov bx, WORD PTR Berry         ; move 0000h to bx
	add ax, bx                     ; add ax and bx together
	adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR Cherry, ax        ; move ax value to end of Cherry

	mov ax, WORD PTR [Apple+2]     ; move 3333h to ax
	mov bx, WORD PTR [Berry+2]     ; move ABCDh to bx
	add ax, dx                     ; add carry stored in dx to ax
	mov dx, 0                      ; clear dx
	add ax, bx                     ; add ax and bx together
    adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR [Cherry+2], ax    ; move ax value to position before last value in Cherry variable

	mov ax, WORD PTR [Apple+4]     ; move 2222h to ax
	mov bx, WORD PTR [Berry+4]     ; move 2468h to bx
	add ax, dx                     ; add carry stored in dx to ax
	mov dx, 0                      ; clear dx
	add ax, bx                     ; add ax and bx together
	adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR [Cherry+4], ax    ; move ax value to position before last value in Cherry variable

	mov ax, WORD PTR [Apple+6]     ; move 1111h to ax
	mov bx, WORD PTR [Berry+6]     ; move 1357h to bx
	add ax, dx                     ; add carry stored in dx to ax
	mov dx, 0                      ; clear dx
	add ax, bx                     ; add ax and bx together
	adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR [Cherry+6], ax    ; move ax value to position before last value in Cherry variable


									; print hex values from eax
	call crlf                          
	call crlf                      
	mov ebx, TYPE placeholder      
	mov edx, OFFSET FinalP
	call WriteString               
	movzx eax, WORD PTR [Cherry+6] 
	call WriteHexB                 
	movzx eax, WORD PTR [Cherry+4] 
	call WriteHexB                 
	movzx eax, WORD PTR [Cherry+2] 
	call WriteHexB                 
	movzx eax, WORD PTR Cherry     
	call WriteHexB                 
	call crlf                      
	exit


main ENDP
END main