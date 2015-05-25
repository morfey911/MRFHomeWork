//
//  MRFArray.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 23.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFArray__
#define __MRFHuman__MRFArray__

#include <stdlib.h>
#include <stdbool.h>

#include "MRFObject.h"

typedef struct {
    MRFObject _super;
    
    void **_data;
    uint64_t _count;
    uint64_t _capacity;
} MRFArray;

extern
void *MRFArrayCreateWithCapacity(uint64_t capacity);

extern
void MRFArrayAddObject(MRFArray *array, void *object);

extern
uint64_t MRFArrayGetCount(MRFArray *array);

extern
bool MRFArrayContainsObject(MRFArray *array, void *object);

extern
uint64_t MRFArrayGetIndexOfObject(MRFArray *array, void *object);

extern
void *MRFArrayGetObjectAtIndex(MRFArray *array, uint64_t index);

extern
void MRFArrayRemoveObjectAtIndex(MRFArray *array, uint64_t index);

extern
void MRFArrayRemoveAllObjects(MRFArray *array);

#endif /* defined(__MRFHuman__MRFArray__) */
