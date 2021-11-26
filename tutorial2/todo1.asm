; Try writing a simple assembly program to print strings using write syscall
; Useful: https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86-32_bit

section .data
	; TODO: fill
	
section .text
	global _start

_start:
	; write
	; TODO: fill

	; exit
	mov rax, 60
	mov rdi, 4
	syscall
