; What will be the value in rax after line 21. Reason why. 

; To run:
; nasm -f elf64 -o todo2c.o todo2c.asm
; ld -o todo2c todo2c.o
; ./todo2c
	
section .text
	global _start

_start:
	mov eax, 0x1
	neg eax
	mov ebx, 0xFFFFFFF8
	cmp eax, ebx
	ja _true
_false:
	mov eax, 0
	jmp _done
_true:
	mov eax, 1
	; --> What is the value of rax here

_done:
	; exit
	mov rax, 60
	mov rdi, 4
	syscall
