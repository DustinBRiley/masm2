.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	source BYTE "This is the string that will be reversed", 0
	target BYTE SIZEOF source DUP('#')
.code
main proc
	mov esi, OFFSET target - 2
	mov edi, OFFSET target
	mov cx, SIZEOF source
	start:
		mov al, [esi]
		mov [edi], al
		dec esi
		inc edi
		loop start
	mov target[edi], 0
	invoke ExitProcess, 0
main endp
end main