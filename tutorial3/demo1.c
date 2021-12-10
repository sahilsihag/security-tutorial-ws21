// gcc demo1.c -Wall -o demo1
// gcc demo1.c -fstack-protector-all -Wall -o demo1_sp

// playing with stack canaries and format strings.

#include <stdio.h>
#include <string.h>

int bad_fun(char *string){
    int i = 44;
    printf(string);
    return i;
}

int main(int argc, char* argv[]) {
    bad_fun(argv[1]);
    return 0;
}
