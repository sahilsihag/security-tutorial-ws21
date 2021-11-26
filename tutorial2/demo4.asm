; Let's go through the instructions quickly;

section .text
	global _start

_start:
	mov eax, 0xffff1234
	mov ax, 0xff

	mov rax, 0xffffffffffffffff
	mov eax, 0x44444444
	; output is rax 0x0000000044444444

	xchg eax, ebx
	xchg ebx, eax

	; common way to make zero
	xor eax, eax
	sub eax, 0x1
	; show effect on flags
	xor eax, eax
	dec eax
	; show effect on flags
	; show difference between 2 outputs.
	; in terms of flags

	; inc/dec has no effect on CF; add/sub has
	; mov effects no flags.
	;---------------

	; square
	mov edx, 0xdeadbeef
	mov eax, 0x13
	mul eax
	; show that rdx is destroyed

	mov eax, 0xffff
	mov ebx, 0xffff0000

	or eax, ebx

	mov eax, 0x1111
	not eax
	neg eax
	; note the difference

	mov eax, 0x11111111
	shl eax, 0x2
	rol eax, 0x2

	nop
	nop
	nop
	jmp _section2

_section1:
	push 0xdd
	push 0xcc
	push 0xbb
	pop rax
	pop rbx
	jmp _section3

_section2:
	jmp _section1
	
_section3:
	lea rax, [rsp]
	lea rax, [rsp + 8]
	; despite [] gives address, not contents

	mov eax, 0xff
	mov ebx, 0xaa
	cmp ebx, eax
	jg _true

_false:
	mov eax, 0x0
	jmp _done

_true:
	mov eax, 0x1

_done:
	mov rax, 60
	mov rdi, 4
	syscall
