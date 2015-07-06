//
//  MRFLinkedListEnumeratorPrivate.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef MRFHuman_MRFLinkedListEnumeratorPrivate_h
#define MRFHuman_MRFLinkedListEnumeratorPrivate_h

#include "MRFLinkedListEnumerator.h"

#pragma mark -
#pragma mark Private Declarations

extern
void MRFLinkedListEnumeratorSetNode(MRFLinkedListEnumerator *enumerator, MRFLinkedListNode *node);

extern
MRFLinkedListNode *MRFLinkedListEnumeratorGetNode(MRFLinkedListEnumerator *enumerator);

extern
MRFLinkedList *MRFLinkedListEnumeratorGetList(MRFLinkedListEnumerator *enumerator);

extern
void MRFLinkedListEnumeratorSetList(MRFLinkedListEnumerator *enumerator, MRFLinkedList *list);

extern
uint64_t MRFLinkedListEnumeratorGetMutationCount(MRFLinkedListEnumerator *enumerator);

extern
void MRFLinkedListEnumeratorSetMutationCount(MRFLinkedListEnumerator *enumerator, uint64_t count);

extern
void MRFLinkedListCheckMutationCount(MRFLinkedListEnumerator *enumerator);

extern
MRFLinkedListNode *MRFLinkedListEnumeratorGetNextNode(MRFLinkedListEnumerator *enumerator);

#endif
