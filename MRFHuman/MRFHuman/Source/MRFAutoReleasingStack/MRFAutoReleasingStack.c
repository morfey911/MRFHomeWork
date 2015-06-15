//
//  MRFAutoReleasingStack.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFAutoReleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

void **MRFAutoReleasingStackGetHead(MRFAutoReleasingStack *stack);

void MRFAutoReleasingStackSetSize(MRFAutoReleasingStack *stack, uint64_t size);

void MRFAutoReleasingStackPopAll(MRFAutoReleasingStack *stack);

#pragma mark -
#pragma mark Public

void __MRFAutoReleasingStackDeallocate(void *object) {
    MRFAutoReleasingStackSetSize(object, 0);
    
    __MRFObjectDeallocate(object);
}

MRFAutoReleasingStack *MRFAutoReleasingStackCreateWithSize(uint64_t size) {
    assert(0 != size);
    
    MRFAutoReleasingStack *stack = MRFObjectCreateOfType(MRFAutoReleasingStack);
    MRFAutoReleasingStackSetSize(stack, size);
    
    return stack;
}

void MRFAutoReleasingStackPushObject(MRFAutoReleasingStack *stack, void *object) {
    if (NULL != stack) {
        assert(false == MRFAutoReleasingStackIsFull(stack));
        
        void **newHead = MRFAutoReleasingStackGetHead(stack) + 1;
        
        *newHead = object;
        stack->_count++;
    }
}

MRFAutoReleasingStackPoppingType MRFAutoReleasingStackPopObject(MRFAutoReleasingStack *stack) {
    MRFAutoReleasingStackPoppingType result = MRFAutoReleasingStackPoppingNULL;
    
    if (NULL != stack) {
        assert(false == MRFAutoReleasingStackIsEmpty(stack));
        
        void **head = MRFAutoReleasingStackGetHead(stack);
        
        if (NULL != *head) {
            MRFObjectRelease(*head);
            result = MRFAutoReleasingStackPoppingObject;
        }
        
        stack->_count -= 1;
    }
    
    return result;
}

//for future MRFAutoReleasingPool
MRFAutoReleasingStackPoppingType MRFAutoReleasingStackPopAllObjects(MRFAutoReleasingStack *stack) {
    MRFAutoReleasingStackPoppingType result = MRFAutoReleasingStackPoppingNULL;
    
    if (stack) {
        while (MRFAutoReleasingStackPoppingObject == MRFAutoReleasingStackPopObject(stack)) {
            if (MRFAutoReleasingStackIsEmpty(stack) ) {
                result = MRFAutoReleasingStackPoppingObject;
            }
        }
    }
    
    return result;
}

uint64_t MRFAutoReleasingStackGetCount(MRFAutoReleasingStack *stack) {
    return (NULL != stack) ? stack->_count : 0;
}

bool MRFAutoReleasingStackIsFull(MRFAutoReleasingStack *stack) {
    return (NULL != stack) && (stack->_size == stack->_count);
}

bool MRFAutoReleasingStackIsEmpty(MRFAutoReleasingStack *stack) {
    return (NULL != stack) && (0 == stack->_count);
}

#pragma mark -
#pragma mark Private Implementations

void **MRFAutoReleasingStackGetHead(MRFAutoReleasingStack *stack) {
    return (NULL != stack) ? stack->_data + stack->_count - 1 : NULL;
}

void MRFAutoReleasingStackSetSize(MRFAutoReleasingStack *stack, uint64_t size) {
    if (NULL != stack) {
        if (NULL != stack->_data && 0 == size) {
            MRFAutoReleasingStackPopAll(stack);
            free(stack->_data);
            stack->_data = NULL;
        } else {
            stack->_data = calloc(size, sizeof(stack->_data));
            assert(NULL != stack->_data);
        }
    }
    
    stack->_size = size;
}

void MRFAutoReleasingStackPopAll(MRFAutoReleasingStack *stack) {
    if (stack) {
        while (!MRFAutoReleasingStackIsEmpty(stack)) {
            MRFAutoReleasingStackPopObject(stack);
        }
    }
}
