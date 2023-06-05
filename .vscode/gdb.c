#include <stdio.h>
#include <stdlib.h>

int main() {
    char *gdb_path = getenv("PATH");
    printf("GDB path: %s\n", gdb_path);
    return 0;
}
