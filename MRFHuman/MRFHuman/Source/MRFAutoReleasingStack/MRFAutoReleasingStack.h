//
//  MRFAutoReleasingStack.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFAutoReleasingStack__
#define __MRFHuman__MRFAutoReleasingStack__

#include <stdbool.h>

#include "MRFObject.h"

typedef enum {
    MRFAutoReleasingStackPoppingNULL,
    MRFAutoReleasingStackPoppingObject
} MRFAutoReleasingStackPoppingType;

typedef struct {
    MRFObject _super;
    
    void **_data;
    
    size_t _size;
    uint64_t _count;
} MRFAutoReleasingStack;

extern
MRFAutoReleasingStack *MRFAutoReleasingStackCreateWithSize(size_t size);

extern
void MRFAutoReleasingStackPushObject(MRFAutoReleasingStack *stack, void *object);

extern
MRFAutoReleasingStackPoppingType MRFAutoReleasingStackPopObject(MRFAutoReleasingStack *stack);

extern
MRFAutoReleasingStackPoppingType MRFAutoReleasingStackPopAllObjects(MRFAutoReleasingStack *stack);

extern
uint64_t MRFAutoReleasingStackGetCount(MRFAutoReleasingStack *stack);

extern
bool MRFAutoReleasingStackIsFull(MRFAutoReleasingStack *stack);

extern
bool MRFAutoReleasingStackIsEmpty(MRFAutoReleasingStack *stack);

extern
void __MRFAutoReleasingStackDeallocate(void *object);

#endif /* defined(__MRFHuman__MRFAutoReleasingStack__) */
