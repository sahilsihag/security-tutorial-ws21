from pwn import *

elf = ELF ("./rop_n_roll")

r = process("./rop_n_roll")
# gadgets can be found using ropper
# example : ropper --file rop_n_roll --search "pop rdx"

# TODO: fill addresses
POP_RDI =
POP_RSI_R15 =
POP_RDX_RAX_RBX =
SYSCALL_POP1 =

# TODO: filename
BIN_SH =

# TODO: build payload

# TODO:
#r.sendline()
#r.recvuntil(b"It was")

#r.sendline()
#r.recvuntil(b"It was")

r.clean()

r.sendline("id")
r.interactive ()
