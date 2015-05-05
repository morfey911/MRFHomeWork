#include <stdio.h>

int isMotherOrFather(int value) {
    if (value % 15 == 0) {
        printf("%s", "мамапапа\n");
        return 15;
    } else if (value % 3 == 0) {
        printf("%s", "мама\n");
        return 3;
    } else if (value % 5 == 0) {
        printf("%s", "папа\n");
        return 5;
    }
    
    return 0;
}

void testForIsMotherOrFather(int value) {
    for (int i = 1; i < value; i++) {
        printf("%d\n", i);
        isMotherOrFather(i);
    }
}
int main() {
    testForIsMotherOrFather(1000);
    
    return 0;
}
