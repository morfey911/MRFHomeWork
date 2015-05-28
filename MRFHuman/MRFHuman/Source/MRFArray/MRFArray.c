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

static const uint64_t kMRFArrayaMaximumCapacity = UINT64_MAX - 1;

#pragma mark -
#pragma mark Private Declarations

static
uint64_t MRFArrayGetCapacity(MRFArray *array);

static
void MRFArraySetCapacity(MRFArray *array, uint64_t capacity);

static
void MRFArrayResizeIfNeeded(MRFArray *array);

static
bool MRFArrayShouldResize(MRFArray *array);

static
uint64_t MRFArrayPrefferedCapacity(MRFArray *array);

static
void MRFArraySetCount(MRFArray *array, uint64_t count);

static
void MRFArraySetObjectAtIndex(MRFArray *array, void *object, uint64_t index);

#pragma mark -
#pragma mark Public

void __MRFArrayDeallocate(void *object) {
    MRFArray *array = object;
    
    MRFArrayRemoveAllObjects(array);
    MRFArraySetCapacity(array, 0);
    
    __MRFObjectDeallocate(array);
}

void *MRFArrayCreateWithCapacity(uint64_t capacity) {
    MRFArray *newArray = MRFObjectCreateOfType(MRFArray);
    
    MRFArraySetCapacity(newArray, capacity);
    
    return newArray;
}

void MRFArrayAddObject(MRFArray *array, void *object) {
    if (NULL != array && NULL != object) {
        uint64_t count = MRFArrayGetCount(array);
        
        MRFArraySetCount(array, count + 1);
        MRFArraySetObjectAtIndex(array, object, count);
    }
}

uint64_t MRFArrayGetCount(MRFArray *array) {
    return NULL != array ? array->_count : 0;
}

bool MRFArrayContainsObject(MRFArray *array, void *object) {
    return (NULL != array) && (kMRFNotFound != MRFArrayGetIndexOfObject(array, object));
}

uint64_t MRFArrayGetIndexOfObject(MRFArray *array, void *object) {
    if (NULL == array) {
        return 0;
    }
    if (NULL == object) {
        return kMRFNotFound;
    }
    
    uint64_t result = kMRFNotFound;
    uint64_t count = MRFArrayGetCount(array);
    
    for (uint64_t i = 0; i < count; i++) {
        if (MRFArrayGetObjectAtIndex(array, i) == object) {
            result = i;
            break;
        }
    }
    
    return result;
}

void *MRFArrayGetObjectAtIndex(MRFArray *array, uint64_t index) {
    void *result = NULL;
    
    if (NULL != array) {
        assert(index < MRFArrayGetCount(array));
        
        result = array->_data[index];
    }
    return result;
}

void MRFArrayRemoveObjectAtIndex(MRFArray *array, uint64_t index) {
    if (NULL != array) {
        MRFArraySetObjectAtIndex(array, NULL, index);
        uint64_t count = MRFArrayGetCount(array);
        
        for (uint64_t i = index + 1; i < count; i ++) {
            MRFArraySetObjectAtIndex(array, MRFArrayGetObjectAtIndex(array, i), i-1);
//            array->_data[i-1] = array->_data[i];
        }
        
        MRFArraySetObjectAtIndex(array, NULL, count-1);
        MRFArraySetCount(array, count-1);
    }
}

void MRFArrayRemoveAllObjects(MRFArray *array) {
    if (NULL != array) {
        uint64_t count = MRFArrayGetCount(array);
        
        for (uint64_t index = 0; index < count; index++) {
            MRFArraySetObjectAtIndex(array, NULL, index);
        }
        
        MRFArraySetCount(array, 0);
    }
}

#pragma mark -
#pragma mark Private Implementations

uint64_t MRFArrayGetCapacity(MRFArray *array) {
    if (NULL != array) {
        return array->_capacity;
    }
    return 0;
}

void MRFArraySetCapacity(MRFArray *array, uint64_t capacity) {
    if (NULL != array && array->_capacity != capacity) {
        assert(kMRFArrayaMaximumCapacity >= capacity);
        
        size_t size = capacity * sizeof(void *);
        
        if (0 == size && NULL != array->_data) {
            free(array->_data);
            array->_data = NULL;
        } else {
            array->_data = realloc(array->_data, size);
            
            assert(NULL != array->_data);
        }
        
        if (capacity > array->_capacity) {
            for (uint64_t index = array->_capacity; index <= capacity; index++) {
                array->_data[index] = NULL;
            }
        }
        
        array->_capacity = capacity;
    }
}

void MRFArrayResizeIfNeeded(MRFArray *array) {
    if (MRFArrayShouldResize(array)) {
        MRFArraySetCapacity(array, MRFArrayPrefferedCapacity(array));
    }
}

bool MRFArrayShouldResize(MRFArray *array) {
    if (NULL != array && array->_capacity != MRFArrayPrefferedCapacity(array)) {
        return true;
    }
    return false;
}

uint64_t MRFArrayPrefferedCapacity(MRFArray *array) {
    if (NULL != array) {
        uint64_t count = MRFArrayGetCount(array);
        uint64_t capacity = MRFArrayGetCapacity(array);
        
        if (count == capacity) {
            return capacity;
        }
        
        if (count < capacity) {
            return count;
        } else {
            return 2 * count;
        }
    }
    
    return 0;
}

void MRFArraySetCount(MRFArray *array, uint64_t count) {
    if (NULL != array) {
        assert(kMRFArrayaMaximumCapacity >= count);
        
        array->_count = count;
        
        MRFArrayResizeIfNeeded(array);
    }
}

void MRFArraySetObjectAtIndex(MRFArray *array, void *object, uint64_t index) {
    if (NULL == array) {
        return;
    }
    
    assert(index < MRFArrayGetCount(array));
    
    MRFObject *currentObject = array->_data[index];
    if (currentObject != object) {
        MRFObjectRetain(object);
        MRFObjectRelease(currentObject);
        
        array->_data[index] = object;
    }
}
