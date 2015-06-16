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

static
const uint64_t MRFAutoReleasingStackDefaultSize = 128;


static MRFAutoReleasePool *__pool = NULL;

static
MRFAutoReleasePool *MRFAutoReleasePoolGetPool();

static
void MRFAutoReleasePoolSetPool(MRFAutoReleasePool *pool);

static
void MRFAutoReleasePoolSetList(MRFAutoReleasePool *pool, MRFLinkedList *list);

static
MRFLinkedList *MRFAutoReleasePoolGetList(MRFAutoReleasePool *pool);

static
MRFAutoReleasingStack *MRFAutoReleasePoolGetStack(MRFAutoReleasePool *pool);

static
void MRFAutoReleasePoolSetStack(MRFAutoReleasePool *pool, MRFAutoReleasingStack *stack);

#pragma mark -
#pragma mark Public

MRFAutoReleasePool *MRFAutoReleasePoolCreate() {
    MRFAutoReleasePool *pool = MRFAutoReleasePoolGetPool();
    
    if (NULL == pool) {
        pool = calloc(1, sizeof(*pool));
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
        MRFAutoReleasingStack *stack = MRFAutoReleasePoolGetStack(pool);
        uint64_t stackSize = MRFAutoReleasingStackDefaultSize;
        
        if (NULL == stack || MRFAutoReleasingStackIsFull(stack)) {
            MRFAutoReleasingStack *newStack = MRFAutoReleasingStackCreateWithSize(stackSize);
            MRFLinkedListAddObject(list, newStack);
            MRFAutoReleasePoolSetStack(pool, newStack);
            
            MRFObjectRelease(newStack);
        }
        
        MRFAutoReleasingStackPushObject(MRFAutoReleasePoolGetStack(pool), object);
    }
}

void MRFAutoReleasePoolDrain(MRFAutoReleasePool *pool) {
    if (NULL != pool) {
        MRFLinkedList *list = MRFAutoReleasePoolGetList(pool);
        MRFAutoReleasingStack *stack = MRFAutoReleasePoolGetStack(pool);
        MRFAutoReleasingStackPoppingType poppingType = MRFAutoReleasingStackPoppingNULL;
        MRFLinkedListEnumerator *enumerator = MRFLinkedListEnumeratorCreateWithList(list);
        
        while (MRFLinkedListEnumeratorIsValid(enumerator)
               && (MRFObject *)stack != MRFLinkedListEnumeratorNextObject(enumerator)) {}
        
        do {
            poppingType = MRFAutoReleasingStackPopAllObjects(stack);
            MRFAutoReleasingStack *nextStack = (MRFAutoReleasingStack *)MRFLinkedListEnumeratorNextObject(enumerator);
            
            if (MRFAutoReleasingStackIsEmpty(stack) && MRFAutoReleasingStackIsFull(nextStack)) {
                stack = nextStack;
                MRFAutoReleasePoolSetStack(pool, stack);
            }
        } while (poppingType == MRFAutoReleasingStackPoppingObject);
        
        MRFObjectRelease(enumerator);
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

MRFAutoReleasingStack *MRFAutoReleasePoolGetStack(MRFAutoReleasePool *pool) {
    return (NULL != pool) ? pool->_currentStack : NULL;
}

void MRFAutoReleasePoolSetStack(MRFAutoReleasePool *pool, MRFAutoReleasingStack *stack) {
    if (NULL != pool) {
        MRFObjectRetain(stack);
        
        MRFObjectRelease(pool->_currentStack);
        pool->_currentStack = stack;
    }
}
