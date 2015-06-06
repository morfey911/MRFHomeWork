//
//  MRFLinkedListNode.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFLinkedListNode.h"

void __MRFLinkedListNodeDeallocate(void *object) {
    MRFLinkedListNodeSetObject(object, NULL);
    
    MRFLinkedListNodeSetNextNode(object, NULL);
    
    __MRFObjectDeallocate(object);
}

MRFLinkedListNode *MRFLinkedListNodeCreateWithObject(void *object) {
    MRFLinkedListNode *node = MRFObjectCreateOfType(MRFLinkedListNode);
    MRFLinkedListNodeSetObject(node, object);
    
    return node;
}

MRFLinkedListNode *MRFLinkedListNodeGetNextNode(MRFLinkedListNode *node) {
    return (NULL != node) ? node->_nextNode : NULL;
}

MRFLinkedListNode *MRFLinkedListNodeGetLastNode(MRFLinkedListNode *node) {
    MRFLinkedListNode *lastNode = NULL;
    
    if (node) {
        while(NULL != node->_nextNode) {
            lastNode = node->_nextNode;
        }
    }
    
    return lastNode;
}

void MRFLinkedListNodeSetNextNode(MRFLinkedListNode *node, MRFLinkedListNode *nextNode) {
    if (NULL != node && node->_nextNode != node) {
        MRFObjectRetain(nextNode);
        MRFObjectRelease(node->_nextNode);
        
        node->_nextNode = nextNode;
    }
}

void *MRFLinkedListNodeGetObject(MRFLinkedListNode *node) {
    return (NULL != node) ? node->_object : NULL;
}

void MRFLinkedListNodeSetObject(MRFLinkedListNode *node, void *object) {
    if (NULL != node) {
        assert(node != object);
        
        void *previousObject = node->_object;
        if (previousObject != object) {
            MRFObjectRetain(object);
            MRFObjectRelease(node->_object);
            
            node->_object = object;
        }
    }
}

