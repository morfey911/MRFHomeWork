#include <stdio.h>

enum Family {
    undefined = 0,
    mother = 3,
    father = 5,
    motherFather = 15
};

int isMotherOrFather(int value) {
    if (value % motherFather == 0) {
        printf("%s", "мамапапа\n");
        return motherFather;
    } else if (value % mother == 0) {
        printf("%s", "мама\n");
        return mother;
    } else if (value % father == 0) {
        printf("%s", "папа\n");
        return father;
    }
    
    return undefined;
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
