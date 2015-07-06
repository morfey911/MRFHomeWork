#include <stdio.h>

#define outputType(type, specificator) \
void output_##type(type value) { \
printf(#specificator "\n", value); \
}

#define executionOutputType(type, value) \
    output_##type(value)

outputType(short, %d);
outputType(int, %d);
outputType(char, %c);
outputType(double, %f);
outputType(float, %f);

int main() {
    executionOutputType(short, 10);
    executionOutputType(int, 10);
    executionOutputType(char, 54);
    executionOutputType(double, 10.5);
    executionOutputType(float, 10.5);
    
    return 0;
}
