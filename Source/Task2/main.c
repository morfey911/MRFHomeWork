#include <stdio.h>

#define VALUE 65.0

#define outputType(type, specificator) \
void output_##type(type value) { \
printf(#specificator, value); \
}

#define executionOutputType(type) \
    output_##type(VALUE)

outputType(short, %d);
outputType(int, %d);
outputType(char, %c);
outputType(double, %f);
outputType(float, %f);

int main() {
    executionOutputType(short);
    executionOutputType(int);
    executionOutputType(char);
    executionOutputType(double);
    executionOutputType(float);
    
    return 0;
}
