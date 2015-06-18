//
//  MRFAutoReleasePool.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 11.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFLinkedListEnumerator.h"
#include "MRFAutoReleasePool.h"
#include "MRFLinkedList.h"

#pragma mark -
#pragma mark Private Declarations

static MRFAutoReleasePool *__pool = NULL;

static
const uint64_t MRFAutoReleasingStackDefaultCapacity = 10;

static
const uint64_t MRFAutoReleasePoolDeflationCount = 2;

static
MRFAutoReleasePool *MRFAutoReleasePoolGetPool();

static
void MRFAutoReleasePoolSetPool(MRFAutoReleasePool *pool);

static
void MRFAutoReleasePoolSetList(MRFAutoReleasePool *pool, MRFLinkedList *list);

static
MRFLinkedList *MRFAutoReleasePoolGetList(MRFAutoReleasePool *pool);

static
MRFAutoReleasingStack *MRFAutoReleasePoolGetEmptyStack (MRFAutoReleasePool *pool);

static
MRFAutoReleasingStack *MRFAutoReleasePoolGetCurrentStack(MRFAutoReleasePool *pool);

static
void MRFAutoReleasePoolSetCurrentStack(MRFAutoReleasePool *pool, MRFAutoReleasingStack *stack);

static
void MRFAutoReleasePoolSetEmptyStacksCount(MRFAutoReleasePool *pool, uint64_t count);

static
uint64_t MRFAutoReleasePoolGetEmptyStacksCount(MRFAutoReleasePool *pool);

static
void MRFAutoReleasePoolDeflateIfNeeded(MRFAutoReleasePool *pool);

static
void MRFAutoReleasePoolDeflate(MRFAutoReleasePool *pool);

#pragma mark -
#pragma mark Public

void __MRFAutoReleasePoolDeallocate(void *object) {
//    MRFAutoReleasePoolSetList(object, NULL);
//    MRFAutoReleasePoolSetCurrentStack(object, NULL);
//    
//    __MRFObjectDeallocate(object);
}

MRFAutoReleasePool *MRFAutoReleasePoolCreate() {
    MRFAutoReleasePool *pool = MRFAutoReleasePoolGetPool();
    
    if (NULL == pool) {
        pool = MRFObjectCreateOfType(MRFAutoReleasePool);
        MRFLinkedList *list = MRFObjectCreateOfType(MRFLinkedList);
        
        MRFAutoReleasePoolSetList(pool, list);
        MRFAutoReleasePoolSetPool(pool);
        
        MRFObjectRelease(list);
    }
    
    MRFAutoReleasePoolAddObject(pool, NULL);
    
    return pool;
}

void MRFAutoReleasePoolAddObject(MRFAutoReleasePool *pool, void *object) {
    if (NULL != pool) {
        MRFLinkedList *list = MRFAutoReleasePoolGetList(pool);
        MRFAutoReleasingStack *stack = MRFAutoReleasePoolGetCurrentStack(pool);
        MRFAutoReleasingStack *previousEmptyStack = MRFAutoReleasePoolGetEmptyStack(pool);
        
        if (NULL == stack || MRFAutoReleasingStackIsFull(stack)) {
            if (NULL != previousEmptyStack) {
                MRFAutoReleasePoolSetCurrentStack(pool, previousEmptyStack);
            } else {
                MRFAutoReleasingStack *newStack =
                    MRFAutoReleasingStackCreateWithSize(MRFAutoReleasingStackDefaultCapacity);
                MRFLinkedListAddObject(list, newStack);
                MRFAutoReleasePoolSetCurrentStack(pool, newStack);
                
                MRFObjectRelease(newStack);
            }
        }
        
        MRFAutoReleasingStackPushObject(MRFAutoReleasePoolGetCurrentStack(pool), object);
    }
}

void MRFAutoReleasePoolDrain(MRFAutoReleasePool *pool) {
    if (NULL != pool) {
        MRFLinkedList *list = MRFAutoReleasePoolGetList(pool);
        MRFAutoReleasingStack *stack = MRFAutoReleasePoolGetCurrentStack(pool);
        MRFAutoReleasingStackPoppingType poppingType = MRFAutoReleasingStackPoppingNULL;
        MRFLinkedListEnumerator *enumerator = MRFLinkedListEnumeratorCreateWithList(list);
        
        while (MRFLinkedListEnumeratorIsValid(enumerator)
               && (MRFObject *)stack != MRFLinkedListEnumeratorNextObject(enumerator)) {}
        
        do {
            poppingType = MRFAutoReleasingStackPopAllObjects(stack);
            MRFAutoReleasingStack *nextStack = (MRFAutoReleasingStack *)MRFLinkedListEnumeratorNextObject(enumerator);
            
            if (MRFAutoReleasingStackIsEmpty(stack) && MRFAutoReleasingStackIsFull(nextStack)) {
                stack = nextStack;
                MRFAutoReleasePoolSetCurrentStack(pool, stack);
                MRFAutoReleasePoolSetEmptyStacksCount(pool, MRFAutoReleasePoolGetEmptyStacksCount(pool) + 1);
            }
        } while (poppingType == MRFAutoReleasingStackPoppingObject);
        
        MRFObjectRelease(enumerator);
        
        MRFAutoReleasePoolDeflateIfNeeded(pool);
    }
}

#pragma mark -
#pragma mark Private Implementations

MRFAutoReleasePool *MRFAutoReleasePoolGetPool() {
    return __pool;
}

void MRFAutoReleasePoolSetPool(MRFAutoReleasePool *pool) {
    if (NULL != pool) {
        __pool = pool;
    }
}

void MRFAutoReleasePoolSetList(MRFAutoReleasePool *pool, MRFLinkedList *list) {
    if (NULL != pool) {
        MRFObjectRetain(list);
        
        MRFObjectRelease(pool->_list);
        pool->_list = list;
    }
}

MRFLinkedList *MRFAutoReleasePoolGetList(MRFAutoReleasePool *pool) {
    return (NULL != pool) ? pool->_list : NULL;
}

MRFAutoReleasingStack *MRFAutoReleasePoolGetEmptyStack (MRFAutoReleasePool *pool) {
    if (NULL != pool) {
        MRFLinkedList *list = MRFAutoReleasePoolGetList(pool);
        MRFAutoReleasingStack *currentStack = MRFAutoReleasePoolGetCurrentStack(pool);
        
        if (0 != MRFAutoReleasePoolGetEmptyStacksCount(pool)) {
            MRFAutoReleasingStack *previousEmptyStack =
            (MRFAutoReleasingStack *)MRFLinkedListGetObjectBeforeObject(list, (MRFObject *)currentStack);
            
            assert(true == MRFAutoReleasingStackIsEmpty(previousEmptyStack));
            
            MRFAutoReleasePoolSetEmptyStacksCount(pool, MRFAutoReleasePoolGetEmptyStacksCount(pool) - 1);
            
            return previousEmptyStack;
        }
    }
    return NULL;
}

MRFAutoReleasingStack *MRFAutoReleasePoolGetCurrentStack(MRFAutoReleasePool *pool) {
    return (NULL != pool) ? pool->_currentStack : NULL;
}

void MRFAutoReleasePoolSetCurrentStack(MRFAutoReleasePool *pool, MRFAutoReleasingStack *stack) {
    if (NULL != pool) {
        MRFObjectRetain(stack);
        
        MRFObjectRelease(pool->_currentStack);
        pool->_currentStack = stack;
    }
}

void MRFAutoReleasePoolSetEmptyStacksCount(MRFAutoReleasePool *pool, uint64_t count) {
    if (NULL != pool) {
        pool->_emptyStacksCount = count;
    }
}

uint64_t MRFAutoReleasePoolGetEmptyStacksCount(MRFAutoReleasePool *pool) {
    return (NULL != pool) ? pool->_emptyStacksCount : 0;
}

void MRFAutoReleasePoolDeflateIfNeeded(MRFAutoReleasePool *pool) {
    if (NULL != pool) {
        if (MRFAutoReleasePoolGetEmptyStacksCount(pool) > MRFAutoReleasePoolDeflationCount) {
            MRFAutoReleasePoolDeflate(pool);
        }
    }
}

void MRFAutoReleasePoolDeflate(MRFAutoReleasePool *pool) {
    if (NULL != pool) {
        MRFLinkedList *list = MRFAutoReleasePoolGetList(pool);
        uint64_t emptyStacksCount = MRFAutoReleasePoolGetEmptyStacksCount(pool);
        uint64_t deflatingCount = MRFAutoReleasePoolDeflationCount;
        uint64_t removeStacksCount = emptyStacksCount - deflatingCount;
        
        for (int i = 0; i < removeStacksCount; i++) {
            MRFLinkedListRemoveFirstObject(list);
        }
        
        MRFAutoReleasePoolSetEmptyStacksCount(pool, deflatingCount);
    }
}
