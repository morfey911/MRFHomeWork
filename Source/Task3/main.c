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

void MRFPrintBytes(int value) {
    union {
        unsigned int val;
        int bytes;
    } byte;
    byte.val = value;
    
    for (int i = 31; i >= 0; i--) {
        printf("%d ", ((byte.bytes >> i) & 1));
    }
}

int main() {
    MRFSizeOfStructsTest();
    OffsetOfStructsTest();
    
    int test = 2;
    
    MRFPrintBytes(test);
    
    return 0;
}
