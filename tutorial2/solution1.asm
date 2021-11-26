; Try writing a simple assembly program to print strings using write syscall
; Useful: https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86_64-64_bit

section .data
	string db "Da da daaa da"
	string_length db 13
	
section .text
	global _start

_start:
	; write
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, string
	mov rdx, [string_length]
	syscall

	; exit
	mov rax, 60
	mov rdi, 4
	syscall
