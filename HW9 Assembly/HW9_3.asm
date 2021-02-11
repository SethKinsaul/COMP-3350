; HW9_3.asm  - Created by Seth Kinsaul
; This program computes the area of the first two terms of a series of triangles inside of one another and the area of the closed form sum.

INCLUDE Irvine32.inc

.data
triArea BYTE (8 * 14)/2
welcomeMsg BYTE "Hello! This program computes the area of a series of triangles inside of one another with base 8 and height 14 on the outside triangle. It will compute the area of the first two terms of the series and the area of the closed form sum.", 0
firstMsg BYTE "The area of the first two terms is: ", 0
secondMsg BYTE "The area of the closed form sum is: ", 0

.code
main PROC
	mov edx, OFFSET welcomeMsg
	call WriteString            ; display welcome messaage
	call crlf                   ; formatting
	call crlf                   ; formatting
	mov edx, 0                  ; clear edx
	mov eax, 0                  ; clear eax

	mov al, triArea				; al = 56
	mov bl, triArea				; bl = 56
	shr bl, 2                   ; bl = 14
	add al, bl                  ; al = 70

	mov edx, OFFSET firstMsg
	call WriteString            ; display first message
	call WriteInt               ; write 70 to screen
	call crlf                   ; formatting
	 
	mov eax, 0                  ; clear eax
	mov al, triArea				; al = 56
	push eax                    
	
	L1:
		pop ebx
		shr bl, 2               ; divide number in bl by 4
		jz emptyVal             ; jump to emptyVal if bl is empty
		add al, bl              ; if not: add it to area sum
		push ebx
		jmp L1                  ; continuous jump until bl is 0

	emptyVal:
	mov edx, OFFSET secondMsg
	call WriteString            ; display second message
	call WriteInt				; print 73
	call crlf                   ; formatting

	exit
main ENDP
END main