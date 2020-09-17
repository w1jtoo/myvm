%include "src/vm/vm.asm"

global _start

section .data
	file db "test.txt", 0

section .bss
	descriptor resb 4        ; storing descriptor
	buffer     resb 1024     ; storing buffer
	buffer_len equ  $-buffer ; buffer size

section .text

_start:
	mov eax, 5 ; open
	mov ebx, file
	mov ecx, 0
	int 0x80

	mov [descriptor], eax
	mov eax, 3 ; read from file
	mov ebx, [descriptor]
	mov ecx, buffer
	mov edx, buffer_len
	int 0x80

	mov esi, eax ; count of readed bytes
	mov edi, buffer

	mov eax, 6 ; close file
	mov ebx, [descriptor]
	int 0x80

	call _compile
	call _exit

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
