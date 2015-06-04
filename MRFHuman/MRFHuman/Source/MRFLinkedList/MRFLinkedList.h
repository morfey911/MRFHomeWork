//
//  MRFLinkedList.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFLinkedList__
#define __MRFHuman__MRFLinkedList__

#include <stdbool.h>

#include "MRFObject.h"
#include "MRFLinkedListNode.h"

typedef struct {
    MRFObject _super;
    
    MRFLinkedListNode *_head;
    uint64_t _count;
} MRFLinkedList;

extern
MRFLinkedList *MRFLinkedListCreateWithObject(void *object);

extern
MRFObject *MRFLinkedListGetFirstObject(MRFLinkedList *list);

extern
void MRFLinkedListRemoveFirstObject(MRFLinkedList *list);

extern
MRFObject *MRFLinkedListGetObjectBeforeObject(MRFLinkedList *list, MRFObject *object);

extern
bool MRFLinkedListIsEmpty(MRFLinkedList *list);

extern
void MRFLinkedListAddObject(MRFLinkedList *list, void *object);

extern
void MRFLinkedListRemoveObject(MRFLinkedList *list, void *object);

extern
void MRFLinkedListRemoveAllObjects(MRFLinkedList *list);

extern
bool MRFLinkedListContainsObject(MRFLinkedList *list, void *object);

extern
uint64_t MRFLinkedListGetCount(MRFLinkedList *list);

extern
void __MRFLinkedListDeallocate(void *object);

#endif /* defined(__MRFHuman__MRFLinkedList__) */
