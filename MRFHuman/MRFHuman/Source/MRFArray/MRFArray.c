//
//  MRFArray.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 23.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include "MRFArray.h"

void __MRFArrayDeallocate(void *array) {
    MRFArrayRemoveAllObjects(array);
    ((MRFArray *)array)->_data = NULL;
    
    __MRFObjectDeallocate(array);
}

void *MRFArrayCreateWithCapacity(uint64_t capacity) {
    MRFArray *newArray = MRFObjectCreateOfType(MRFArray);
    
    newArray->_data = malloc(capacity * sizeof(void *));
    assert(NULL != newArray->_data);
    newArray->_count = 0;
    newArray->_capacity = capacity;
    
    return newArray;
}

void MRFArrayAddObject(MRFArray *array, void *object) {
    if (NULL != array) {
        uint64_t newCount = array->_count + 1;
        
        if (newCount > array->_capacity) {
            uint64_t newCapacity = array->_capacity * 1.05;
            if (newCapacity == array->_capacity) {
                newCapacity += 10;
            }
            void **newData = realloc(array->_data, newCapacity * sizeof(void *));
            
            assert(NULL != newData);
            
            array->_capacity = newCapacity;
            array->_data = newData;
        }
        MRFObjectRetain(object);
        array->_data[array->_count] = object;
        array->_count = newCount;
    }
}

uint64_t MRFArrayGetCount(MRFArray *array) {
    return array->_count;
}

bool MRFArrayContainsObject(MRFArray *array, void *object) {
    return (array->_count > 0) ? true : false;
}

uint64_t MRFArrayGetIndexOfObject(MRFArray *array, void *object) {
    if (NULL != array) {
        for (uint64_t i = 0; i < array->_count; i++) {
            if (array->_data[i] == object) {
                return i;
            }
        }
    }
    return -1;
}

void *MRFArrayGetObjectAtIndex(MRFArray *array, uint64_t index) {
    return array->_data[index];
}

void MRFArrayRemoveObjectAtIndex(MRFArray *array, uint64_t index) {
    if (NULL != array && index < array->_count) {
        for (uint64_t i = index + 1; i < array->_count; i++) {
            array->_data[i-1] = array->_data[i];
        }
        MRFObjectRelease(array->_data[index]);
        array->_count -= 1;
        array->_data[array->_count] = NULL;
        if (array->_count < array->_capacity - 50) {
            uint64_t newCapacity = array->_capacity - 50;
            
            void **newData = realloc(array->_data, newCapacity * sizeof(void *));
            
            assert(NULL != newData);
            
            array->_capacity = newCapacity;
            array->_data = newData;
        }
    }
}

void MRFArrayRemoveAllObjects(MRFArray *array) {
    if (NULL != array) {
        uint64_t limit = array->_count;
        
        for (uint64_t i = 0; i < limit; i++) {
            MRFObjectRelease(array->_data[i]);
            array->_data[i] = NULL;
            array->_count -= 1;
        }
    }
}