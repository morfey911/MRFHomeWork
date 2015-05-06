#include <stdio.h>
#include <limits.h>

#define MRFSizeOf(type, value) \
    printf("size = %lu bytes, value = %d\n", sizeof(type), value)

#define MRFSizeOfFloating(type, value) \
    printf("size = %lu bytes, value = %f\n", sizeof(type), value)

int main() {
    MRFSizeOf(short, SHRT_MAX);
    MRFSizeOf(unsigned short int, USHRT_MAX);
    MRFSizeOf(int, INT_MAX);
    MRFSizeOf(unsigned int, 100);
    MRFSizeOf(long, 100);
    MRFSizeOf(unsigned long, 100);
    
    MRFSizeOfFloating(float, 8.5);
    MRFSizeOfFloating(double, 9.5);
    MRFSizeOfFloating(long double, 10.5);
    
    return 0;
}
