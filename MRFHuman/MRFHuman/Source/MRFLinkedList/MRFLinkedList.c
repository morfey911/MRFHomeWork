//
//  MRFLinkedList.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include "MRFLinkedListPrivate.h"

#pragma mark -
#pragma mark Public Implementations

void __MRFLinkedListDeallocate(void *object) {
    MRFLinkedListSetHead(object, NULL);
    
    __MRFObjectDeallocate(object);
}

MRFObject *MRFLinkedListGetFirstObject(MRFLinkedList *list) {
    return list ? MRFLinkedListNodeGetObject(MRFLinkedListGetHead(list)) : NULL;
}

void MRFLinkedListRemoveFirstObject(MRFLinkedList *list) {
    if (list && false == MRFLinkedListIsEmpty(list)) {
        MRFLinkedListNode *node = MRFLinkedListGetHead(list);
        
        MRFLinkedListSetHead(list, MRFLinkedListNodeGetNextNode(node));
        MRFLinkedListSetCount(list, MRFLinkedListGetCount(list) - 1);
    }
}

MRFObject *MRFLinkedListGetObjectBeforeObject(MRFLinkedList *list, MRFObject *object) {
    if (list && false == MRFLinkedListIsEmpty(list)) {
        MRFLinkedListNode *currentNode = MRFLinkedListGetHead(list);
        MRFObject *previousObject = NULL;
        
        while (NULL != currentNode) {
            MRFObject *currentObject = MRFLinkedListNodeGetObject(currentNode);
            
            if (object == currentObject) {
                return previousObject;
            }
            
            previousObject = currentObject;
            
            currentNode = MRFLinkedListNodeGetNextNode(currentNode);
        }
    }
    return NULL;
}

bool MRFLinkedListIsEmpty(MRFLinkedList *list) {
    return (NULL != list) && (0 == list->_count);
}

void MRFLinkedListAddObject(MRFLinkedList *list, void *object) {
    if (list) {
        MRFLinkedListNode *newNode = MRFLinkedListNodeCreateWithObject(object);
        
        MRFLinkedListNodeSetNextNode(newNode, MRFLinkedListGetHead(list));
        MRFLinkedListSetHead(list, newNode);
        MRFLinkedListSetCount(list, MRFLinkedListGetCount(list) + 1);
        
        MRFObjectRelease(newNode);
    }
}

void MRFLinkedListRemoveObject(MRFLinkedList *list, void *object) {
    if (list && false == MRFLinkedListIsEmpty(list)) {
        MRFLinkedListNode *node = MRFLinkedListGetHead(list);
        MRFLinkedListNode *previousNode = NULL;
        
        while (NULL != node) {
            MRFObject *currentObject = MRFLinkedListNodeGetObject(node);
            MRFLinkedListNode *nextNode = MRFLinkedListNodeGetNextNode(node);
            
            if (object == currentObject) {
                if (node == MRFLinkedListGetHead(list)) {
                    MRFLinkedListSetHead(list, nextNode);
                } else {
                    MRFLinkedListNodeSetNextNode(previousNode, nextNode);
                }
                
                MRFLinkedListSetCount(list, MRFLinkedListGetCount(list) - 1);
            }
            
            previousNode = node;
            node = nextNode;
        }
    }
}

void MRFLinkedListRemoveAllObjects(MRFLinkedList *list) {
    if (list && false == MRFLinkedListIsEmpty(list)) {
        MRFLinkedListSetCount(list, 0);
    }
}

bool MRFLinkedListContainsObject(MRFLinkedList *list, void *object) {
    if (list) {
        MRFLinkedListNode *node = MRFLinkedListGetHead(list);
        
        while(NULL != node) {
            if (object == MRFLinkedListNodeGetObject(node)) {
                return true;
            }
            
            node = MRFLinkedListNodeGetNextNode(node);
        }
    }
    
    return false;
}

uint64_t MRFLinkedListGetCount(MRFLinkedList *list) {
    return list ? list->_count : 0;
}

#pragma mark -
#pragma mark Private Implementations

void MRFLinkedListSetCount(MRFLinkedList *list, uint64_t count) {
    if (list) {
        if (0 == count) {
            MRFLinkedListSetHead(list, NULL);
        }
        
        list->_count = count;
    }
}

MRFLinkedListNode *MRFLinkedListGetHead(MRFLinkedList *list) {
    return list ? list->_head : NULL;
}

void MRFLinkedListSetHead(MRFLinkedList *list, MRFLinkedListNode *node) {
    if (list) {
        MRFObjectRetain(node);
        MRFObjectRelease(list->_head);
        
        list->_head = node;
    }
}

void MRFLinkedListSetMutationCount(MRFLinkedList *list, uint64_t count) {
    if (NULL != list) {
        list->_mutationCount = count;
    }
}

uint64_t MRFLinkedListGetMutationCount(MRFLinkedList *list) {
    return (NULL != list) ? list->_mutationCount : 0;
}

void MRFLinkedListMutate(MRFLinkedList *list) {
    if (NULL != list) {
        MRFLinkedListSetMutationCount(list, MRFLinkedListGetMutationCount(list) + 1);
    }
}
