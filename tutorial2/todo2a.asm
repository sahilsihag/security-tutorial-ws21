; What will be the value in rax after line 22. Reason why. 

; To run:
; nasm -f elf64 -o todo2a.o todo2a.asm
; ld -o todo2a todo2a.o
; ./todo2a
	
section .text
	global _start

_start:
	mov rsi, 8
	push 15
	push rsi
	mov rax, qword [rsp]
	lea rax, [rsp + rax * 2 + 8]
	sub rax, 16
	mov rax, qword [rax]
	pop rbx
	add rsp, 8
	add rax, rbx
	; --> What is the value of rax here

	; exit
	mov rax, 60
	mov rdi, 4
	syscall
