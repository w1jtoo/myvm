global _compile


section .text
; edi -- pointer to array of machine codes
; esi -- length of  array of machine codes

_compile:
	mov eax, 4
	mov ebx, 1
	mov ecx, edi
	mov edx, esi
	int 80h

	ret


