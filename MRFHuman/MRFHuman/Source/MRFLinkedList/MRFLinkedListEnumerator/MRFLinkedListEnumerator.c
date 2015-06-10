//
//  MRFLinkedListEnumerator.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFLinkedListNode.h"
#include "MRFLinkedListEnumeratorPrivate.h"
#include "MRFLinkedListPrivate.h"
#include "MRFLinkedList.h"

void __MRFLinkedListEnumeratorDeallocate(void *object) {
    MRFLinkedListEnumeratorSetList(object, NULL);
    MRFLinkedListEnumeratorSetNode(object, NULL);
    
    __MRFObjectDeallocate(object);
}

MRFLinkedListEnumerator *MRFLinkedListEnumeratorCreateWithList(MRFLinkedList *list) {
    if (NULL == list) {
        return NULL;
    }
    MRFLinkedListEnumerator *enumerator = MRFObjectCreateOfType(MRFLinkedListEnumerator);
    MRFLinkedListEnumeratorSetList(enumerator, list);
    MRFLinkedListEnumeratorSetMutationCount(enumerator, MRFLinkedListGetMutationCount(list));
    
    return enumerator;
}

MRFObject *MRFLinkedListEnumeratorNextObject(MRFLinkedListEnumerator *enumerator) {
    if (NULL == enumerator) {
        return NULL;
    }
    
    return MRFLinkedListNodeGetObject(MRFLinkedListEnumeratorGetNextNode(enumerator));
}

bool MRFLinkedListEnumeratorIsValid(MRFLinkedListEnumerator *enumerator) {
    return ((NULL != enumerator) && enumerator->_valid);
}

#pragma mark -
#pragma mark Private Implementations

void MRFLinkedListEnumeratorSetNode(MRFLinkedListEnumerator *enumerator, MRFLinkedListNode *node) {
    if (NULL != enumerator) {
        MRFObjectRetain(node);
        
        MRFObjectRelease(enumerator->_node);
        enumerator->_node = node;
    }
}

MRFLinkedListNode *MRFLinkedListEnumeratorGetNode(MRFLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_node : NULL;
}

MRFLinkedList *MRFLinkedListEnumeratorGetList(MRFLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_list : NULL;
}

void MRFLinkedListEnumeratorSetList(MRFLinkedListEnumerator *enumerator, MRFLinkedList *list) {
    if (NULL != enumerator) {
        MRFObjectRetain(list);
        
        MRFObjectRelease(enumerator->_list);
        enumerator->_list = list;
    }
}

uint64_t MRFLinkedListEnumeratorGetMutationCount(MRFLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_mutationCount : 0;
}

void MRFLinkedListEnumeratorSetMutationCount(MRFLinkedListEnumerator *enumerator, uint64_t count) {
    if (NULL != enumerator) {
        enumerator->_mutationCount = count;
    }
}

void MRFLinkedListCheckMutationCount(MRFLinkedListEnumerator *enumerator) {
    if (NULL != enumerator) {
        assert(MRFLinkedListEnumeratorGetMutationCount(enumerator) == MRFLinkedListGetMutationCount(MRFLinkedListEnumeratorGetList(enumerator)));
    }
}

MRFLinkedListNode *MRFLinkedListEnumeratorGetNextNode(MRFLinkedListEnumerator *enumerator) {
    if (NULL == enumerator || !MRFLinkedListEnumeratorIsValid(enumerator)) {
        return NULL;
    }
    
    MRFLinkedListCheckMutationCount(enumerator);
    
    MRFLinkedListNode *node = MRFLinkedListEnumeratorGetNode(enumerator);
    MRFLinkedListNode *nextNode = NULL;
    
    if (NULL == node) {
        nextNode = MRFLinkedListGetHead(MRFLinkedListEnumeratorGetList(enumerator));
    } else {
        nextNode = MRFLinkedListNodeGetNextNode(node);
    }
    
    MRFLinkedListEnumeratorSetNode(enumerator, nextNode);
    
    if (NULL == nextNode) {
        enumerator->_valid = false;
    }
    
    return nextNode;
}
