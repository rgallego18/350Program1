#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main() {
    int pid = getppid();
    printf("Parent Process ID: %d\n", pid);
    exit(0);
}


