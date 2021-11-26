; A few variables will be nice

; db 	define byte; 8 bits
; dw 	define word; generally 16 bits
; dd 	define double word; generally 32 bits


section .data
	; [variable name] define-directive initial-value
	syscall_number db 60
	error_code db 0

section .text
	global _start

_start:
	mov rax, [syscall_number]
	mov rdi, [error_code]
	syscall
