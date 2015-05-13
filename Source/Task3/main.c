#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>

#include "sizeOfStruct.h"
#include "Task3Structs.h"
#include "OffsetOfStructsTest.h"

//Задачи:
//1. Создать структуру, данных, хранящую в себе расположенные в случайном порядке 6 bool, 1 float, 1 int, 1 long long, 3 short, 1 double, 1 указатель на строку.
//Примечание:
//- Дополнитель должны быть объявлены и протестированы еще 2 варианта оригинальной структуры:
//1) все поля перекомпонованы так, чтобы структура имела минимальный размер (sizeof);
//2) вариант 2 с union для переменных типа bool (поместить bool значения в битовое поле и создать union);
//Требования:
//- создать тестовый метод, который бы с помощью offsetof выводил расположение каждого из элементов структуры;
//- создать тестовый метод, который бы выводил размер всей структуры;
//2. Создать универсальный метод для вывода битов числа (различных типов) в консоль.

enum byteOrder {
    bigEndian = 0,
    littleEndian = 1
};

int MRFByteOrder() {
    unsigned short testVar= 1;
    
    if (*((unsigned char*) &testVar) != 0) {
        return littleEndian;
    }
    return bigEndian;
}

void MRFPrintByte(char *byteAdress) {
    int value = *byteAdress;
    
    for (int i = 8; i > 0; i--) {
        int shiftedValue = value >> (i - 1);
        printf("%d ", (shiftedValue & 1));
    }
}

void MRFPrintBitField(void *byteAddress, int size) {
    char* bitfieldAdress = (char *)byteAddress;
    int byteOrder = MRFByteOrder();
    
    if (byteOrder == bigEndian) {
        bitfieldAdress += size - 1;
    }
    
    for (int i = 0; i < size; i++) {
        MRFPrintByte(bitfieldAdress);
        if (byteOrder == bigEndian) {
            bitfieldAdress--;
        }
        bitfieldAdress++;
    }
    printf("\n");
}

int main() {
//    MRFSizeOfStructsTest();
//    OffsetOfStructsTest();
    
    int test = 1;
//    char testChar = 8;
    
//    MRFPrintBit(test);
    
//    MRFPrintByte2(&testChar);
    
//    MRFPrintBitefield(&testChar, sizeof(testChar));
//    printf("%d", MRFByteOrder());
    
    MRFPrintBitField(&test, sizeof(test));
    
    return 0;
}
