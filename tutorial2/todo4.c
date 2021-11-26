#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]) {
    int result = 0;
/*    char s1[] = "<removed>";*/
/*    char s2[] = "<removed>";*/

    printf("Enter your key (7 characters):\n");
    
    scanf("%7s", s1);
    
    for(int i=0; i < 7; i++){
        int k = s1[i];
        k = k + i;
        char c = k;
        s1[i] = c;
    }
    
    result = strcmp(s1, s2);

    if(result == 0){
        printf("Correct key.\n");
    }
    else {
        printf("Wrong key.\n");
    }
    return 0;
}
