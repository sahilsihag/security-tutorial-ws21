; What will be the value in rax after line 18. Reason why. 

; To run:
; nasm -f elf64 -o todo2b.o todo2b.asm
; ld -o todo2b todo2b.o
; ./todo2b
	
section .text
	global _start

_start:
	xor eax, eax
	add eax, 1234h
	ror eax, 16
	or eax, 55h
	inc eax
	shl ax, 8
	mov al, 78h
	; --> What is the value of rax here

	; exit
	mov rax, 60
	mov rdi, 4
	syscall
