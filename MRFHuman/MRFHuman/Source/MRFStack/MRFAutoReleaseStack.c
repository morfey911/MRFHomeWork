//
//  MRFAutoReleaseStack.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFAutoReleaseStack.h"

#pragma mark -
#pragma mark Private Declarations

void **MRFAutoReleaseStackGetHead(MRFAutoReleaseStack *stack);

void MRFAutoReleaseStackSetSize(MRFAutoReleaseStack *stack, size_t size);

#pragma mark -
#pragma mark Public

void __MRFAutoReleaseStackDeallocate(void *object) {
    MRFAutoReleaseStackSetSize(object, 0);
    
    __MRFObjectDeallocate(object);
}

MRFAutoReleaseStack *MRFAutoReleaseStackCreateWithSize(size_t size) {
    assert(0 != size);
    
    MRFAutoReleaseStack *stack = MRFObjectCreateOfType(MRFAutoReleaseStack);
    MRFAutoReleaseStackSetSize(stack, size);
    
    return stack;
}

void MRFAutoReleaseStackPush(MRFAutoReleaseStack *stack, void *object) {
    if (NULL != stack) {
        assert(false == MRFAutoReleaseStackIsFull(stack));
        
        void **newHead = MRFAutoReleaseStackGetHead(stack) + 1;
        
        *newHead = object;
        stack->_count++;
    }
}

MRFAutoReleaseStackPopType MRFAutoReleaseStackPop(MRFAutoReleaseStack *stack) {
    MRFAutoReleaseStackPopType result = MRFAutoReleaseStackPopNULL;
    
    if (NULL != stack) {
        assert(false == MRFAutoReleaseStackIsEmpty(stack));
        
        void **head = MRFAutoReleaseStackGetHead(stack);
        
        if (NULL != *head) {
            MRFObjectRelease(*head);
            result = MRFAutoReleaseStackPopObject;
            
            stack->_count -= 1;
        }
    }
    
    return result;
}

void MRFAutoReleaseStackPopAll(MRFAutoReleaseStack *stack) {
    if (stack) {
        while (!MRFAutoReleaseStackIsEmpty(stack)) {
            MRFAutoReleaseStackPop(stack);
        }
    }
}

uint64_t MRFAutoReleaseStackGetCount(MRFAutoReleaseStack *stack) {
    return (NULL != stack) ? stack->_count : 0;
}

bool MRFAutoReleaseStackIsFull(MRFAutoReleaseStack *stack) {
    return (NULL != stack) && (stack->_size == stack->_count);
}

bool MRFAutoReleaseStackIsEmpty(MRFAutoReleaseStack *stack) {
    return (NULL != stack) && (0 == stack->_count);
}

#pragma mark -
#pragma mark Private Implementations

void **MRFAutoReleaseStackGetHead(MRFAutoReleaseStack *stack) {
    return (NULL != stack) ? stack->_data + stack->_count - 1 : NULL;
}

void MRFAutoReleaseStackSetSize(MRFAutoReleaseStack *stack, size_t size) {
    if (NULL != stack) {
        if (NULL != stack->_data && 0 == size) {
            MRFAutoReleaseStackPopAll(stack);
            free(stack->_data);
            stack->_data = NULL;
        } else {
            stack->_data = calloc(size, sizeof(stack->_data));
            assert(NULL != stack->_data);
        }
    }
    
    stack->_size = size;
}
