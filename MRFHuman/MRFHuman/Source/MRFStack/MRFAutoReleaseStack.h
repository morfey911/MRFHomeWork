//
//  MRFAutoReleaseStack.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFAutoReleaseStack__
#define __MRFHuman__MRFAutoReleaseStack__

#include <stdbool.h>

#include "MRFObject.h"

typedef enum {
    MRFAutoReleaseStackPopNULL,
    MRFAutoReleaseStackPopObject
} MRFAutoReleaseStackPopType;

typedef struct {
    MRFObject _super;
    
    void **_data;
    
    size_t _size;
    uint64_t _count;
} MRFAutoReleaseStack;

extern
MRFAutoReleaseStack *MRFAutoReleaseStackCreateWithSize(size_t size);

extern
void MRFAutoReleaseStackPush(MRFAutoReleaseStack *stack, void *object);

extern
MRFAutoReleaseStackPopType MRFAutoReleaseStackPop(MRFAutoReleaseStack *stack);

extern
void MRFAutoReleaseStackPopAll(MRFAutoReleaseStack *stack);

extern
MRFAutoReleaseStackPopType MRFAutoReleaseStackPopAllObjects(MRFAutoReleaseStack *stack);

extern
uint64_t MRFAutoReleaseStackGetCount(MRFAutoReleaseStack *stack);

extern
bool MRFAutoReleaseStackIsFull(MRFAutoReleaseStack *stack);

extern
bool MRFAutoReleaseStackIsEmpty(MRFAutoReleaseStack *stack);

extern
void __MRFAutoReleaseStackDeallocate(void *object);

#endif /* defined(__MRFHuman__MRFAutoReleaseStack__) */
