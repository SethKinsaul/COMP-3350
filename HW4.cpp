TITLE My first assembly program INCLUDE
Irvine32.inc
.DATA
Message BYTE  "Seth Kinsaul",0
.CODE
main PROC
	mov edx, offset message
	Call WriteString
	exit
main ENDP
END main