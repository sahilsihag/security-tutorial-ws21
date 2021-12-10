// gcc rop_n_roll.c -O0 -lseccomp -no-pie -fno-stack-protector -masm=intel -o rop_n_roll

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <seccomp.h>



char BIN_SH[] = "/bin/sh";

void optimized_print(char* buf, int buf_len) {
  __asm__ __volatile__(
      "push rax;"    // store rax,rdx as we do not want to clobber too many regs
      "push rdx;"
      "mov rdi, 1;"  // stdout
      "mov rsi, %0;" // buf
      "mov edx, %1;" // len
      "mov rax, 1;"  // sys_write
      "syscall;"
      "pop rdx;"     // restore rax, rdx
      "pop rax;"
      : // no output
      : "r"(buf), "r"(buf_len)
      : "rdi", "rsi", "rcx"
      );

}

void optimized_print2(char* buf, int buf_len) {
  __asm__ __volatile__(
      "mov rdi, 1;"  // stdout
      "mov rsi, %0;" // buf
      "mov edx, %1;" // len
      "mov rax, 1;"  // sys_write
      "syscall;"
      : // no output
      : "r"(buf), "r"(buf_len)
      : "rdi", "rsi", "rax", "rdx"
      );
  //TODO: implement optimized print
}

void read_input()
{

  char buf[500] = {0};
  unsigned int read_bytes = 0;

  char welcome_msg[] = "Hi! Please provide input.\n";
  optimized_print(welcome_msg, strlen(welcome_msg));

  while (read_bytes < 500)
  {
    // make sure that no more than 500 bytes are read to prevent buffer overflow
    unsigned int val = read(0, (buf + read_bytes), 500);
    read_bytes += val;
    printf("Input provided. It was \"%s\".\n", buf);
  }
  return; //nothing can ever go wrong here
}


int main(void)
{
  // disable buffering for standard streams
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);
  //sandbox_program();

  printf("Try to spawn a shell via %s!\n", BIN_SH);
  
  read_input();
  //TODO: do something with the input
  return 0;
}
