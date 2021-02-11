; HW7_3.asm			Seth Kinsaul
;This program has the functionality to scan an array and determine the first even integer
;If a value is found program prints warningMsg with its value and index


INCLUDE Irvine32.inc

.data
ArraySW SWORD 10 DUP(?)
welcomeMsg BYTE "Hello! This program has the functionality to scan an array and determine the first even integer If a value is found program prints warningMsg with its value and index", 0
prompt BYTE "Enter your desired integer: ", 0
firstEvenInteger BYTE "First even integer in the program is: ", 0
evenIndice BYTE ", and it is located at indice ", 0
evenSpotter BYTE "Even integer found!", 0
noEvenMsg BYTE "No even integer found", 0
evenValue SWORD 0
evenIndex WORD 0

.code
main PROC

	mov edx, OFFSET welcomeMsg
	call writeString
	call crlf
	call crlf
	mov edx, OFFSET prompt
	mov ebx, 0
	mov ecx, 10
	
	Loop1:
		call writeString
		call ReadInt
		mov ArraySW[ebx], ax
		add ebx, 2
	loop loop1

	mov eax, 0
	mov ebx, 0
	mov ecx, 10
	

	Loop2:
		movsx eax, ArraySW[ebx]
		test ax, 2
		jz J1		;if odd
		jnz J2		;if even
		J1:
		add ebx, 2
		mov edx, OFFSET noEvenMsg
	Loop Loop2
	
	J2:
	mov ecx, 1
	test ax, 2
	
	jz J3
	mov evenValue, ax
	mov eax, ebx
	mov bx, 2
	div bl
	mov evenIndex, ax
	mov edx, OFFSET evenSpotter
	movsx eax, evenValue

	J3:
	call crlf
	call crlf
	call writeString
	test ax, 2
	jz J4
	call crlf
	mov edx, OFFSET firstEvenInteger
	call writeString
	movsx eax, evenValue
	call writeInt
	mov edx, OFFSET evenIndice
	call writeString
	mov eax, ecx
	call WriteInt
						;movzx eax, evenIndice
						;call writeInt
	J4:
	call crlf
	call crlf

main ENDP 
END main	; end

					

