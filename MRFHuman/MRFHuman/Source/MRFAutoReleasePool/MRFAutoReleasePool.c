//
//  MRFAutoReleasePool.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 11.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include "MRFAutoReleasePool.h"
#include "MRFLinkedList.h"

#pragma mark -
#pragma mark Private Declarations

static
const uint64_t MRFAutoReleasingStackMaxSize = 100;


static MRFAutoReleasePool *__pool = NULL;

MRFAutoReleasePool *MRFAutoReleasePoolGetPool();

void MRFAutoReleasePoolSetPool(MRFAutoReleasePool *pool);

void MRFAutoReleasePoolSetList(MRFAutoReleasePool *pool, MRFLinkedList *list);

MRFLinkedList *MRFAutoReleasePoolGetList(MRFAutoReleasePool *pool);

MRFAutoReleasingStack *MRFAutoReleasePoolGetStack(MRFAutoReleasePool *pool);

void MRFAutoReleasePoolSetStack(MRFAutoReleasePool *pool, MRFAutoReleasingStack *stack);

void MRFAutoReleasePoolAddObject(MRFAutoReleasePool *pool, void *object);

#pragma mark -
#pragma mark Public

MRFAutoReleasePool *MRFAutoReleasePoolCreate() {
    MRFAutoReleasePool *pool = MRFAutoReleasePoolGetPool();
    
    if (NULL == pool) {
        pool = calloc(1, sizeof(*pool));
        MRFAutoReleasePoolSetPool(pool);
        
        MRFLinkedList *list = MRFObjectCreateOfType(MRFLinkedList);
        MRFAutoReleasePoolSetList(pool, list);
        
        MRFObjectRelease(list);
    }
    
    MRFAutoReleasePoolAddObject(pool, NULL);
    
    return pool;
}

void MRFAutoReleasePoolAddObject(MRFAutoReleasePool *pool, void *object) {
    if (NULL != pool) {
        MRFLinkedList *list = MRFAutoReleasePoolGetList(pool);
        MRFAutoReleasingStack *stack = MRFAutoReleasePoolGetStack(pool);
        uint64_t stackSize = MRFAutoReleasingStackMaxSize;
        
        if (NULL == stack || MRFAutoReleasingStackIsFull(stack)) {
            MRFAutoReleasingStack *newStack = MRFAutoReleasingStackCreateWithSize(stackSize);
            MRFLinkedListAddObject(list, newStack);
            MRFAutoReleasePoolSetStack(pool, newStack);
            
            MRFObjectRelease(newStack);
        }
        
        MRFAutoReleasingStackPushObject(MRFAutoReleasePoolGetStack(pool), object);
    }
}

void MRFAutoReleasePoolDrain(MRFAutoReleasePool *pool);

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

MRFAutoReleasingStack *MRFAutoReleasePoolGetStack(MRFAutoReleasePool *pool) {
    return (NULL != pool) ? pool->_stack : NULL;
}

void MRFAutoReleasePoolSetStack(MRFAutoReleasePool *pool, MRFAutoReleasingStack *stack) {
    if (NULL != pool) {
        MRFObjectRetain(stack);
        
        MRFObjectRelease(pool->_stack);
        pool->_stack = stack;
    }
}
