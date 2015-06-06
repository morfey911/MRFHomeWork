//
//  MRFLinkedListNode.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFLinkedListNode__
#define __MRFHuman__MRFLinkedListNode__

#include "MRFObject.h"

typedef struct MRFLinkedListNode MRFLinkedListNode;

struct MRFLinkedListNode {
    MRFObject _super;
    
    MRFLinkedListNode *_nextNode;
    void *_object;
};

extern
MRFLinkedListNode *MRFLinkedListNodeCreateWithObject(void *object);

extern
MRFLinkedListNode *MRFLinkedListNodeGetNextNode(MRFLinkedListNode *node);

extern
MRFLinkedListNode *MRFLinkedListNodeGetLastNode(MRFLinkedListNode *node);

extern
void MRFLinkedListNodeSetNextNode(MRFLinkedListNode *node, MRFLinkedListNode *nextNode);

extern
void *MRFLinkedListNodeGetObject(MRFLinkedListNode *node);

extern
void MRFLinkedListNodeSetObject(MRFLinkedListNode *node, void *object);

extern
void __MRFLinkedListNodeDeallocate(void *object);

#endif /* defined(__MRFHuman__MRFLinkedListNode__) */
