#include <stdio.h>
#include <limits.h>

#define MRFSizeOf(type) \
    printf("Size of " #type " = %lu bytes\n", sizeof(type))

int main() {
    MRFSizeOf(short);
    MRFSizeOf(unsigned short int);
    MRFSizeOf(int);
    MRFSizeOf(unsigned int);
    MRFSizeOf(long);
    MRFSizeOf(unsigned long);
    
    return 0;
}
