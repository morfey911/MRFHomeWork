//
//  MRFLinkedListPrivate.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef MRFHuman_MRFLinkedListPrivate_h
#define MRFHuman_MRFLinkedListPrivate_h

#include "MRFLinkedList.h"

#pragma mark -
#pragma mark Private Declarations

extern
void MRFLinkedListSetCount(MRFLinkedList *list, uint64_t count);

extern
void MRFLinkedListSetHead(MRFLinkedList *list, MRFLinkedListNode *node);

extern
MRFLinkedListNode *MRFLinkedListGetHead(MRFLinkedList *list);

extern
uint64_t MRFLinkedListGetMutationCount(MRFLinkedList *list);

extern
void MRFLinkedListMutate(MRFLinkedList *list);

#endif
