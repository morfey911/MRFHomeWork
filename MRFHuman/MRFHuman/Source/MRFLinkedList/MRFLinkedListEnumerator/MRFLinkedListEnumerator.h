//
//  MRFLinkedListEnumerator.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFLinkedListEnumerator__
#define __MRFHuman__MRFLinkedListEnumerator__

#include <stdbool.h>

#include "MRFObject.h"

typedef struct MRFLinkedList MRFLinkedList;
typedef struct MRFLinkedListNode MRFLinkedListNode;
typedef struct MRFLinkedListEnumerator MRFLinkedListEnumerator;

struct MRFLinkedListEnumerator {
    MRFObject *_super;
    
    MRFLinkedList *_list;
    MRFLinkedListNode *_node;
    
    uint64_t _mutationCount;
    bool _valid;
    
};

extern
MRFLinkedListEnumerator *MRFLinkedListEnumeratorCreateWithList(MRFLinkedList *list);

extern
MRFObject *MRFLinkedListEnumeratorNextObject(MRFLinkedListEnumerator *enumerator);

extern
bool MRFLinkedListEnumeratorIsValid(MRFLinkedListEnumerator *enumerator);

extern
void __MRFLinkedListEnumeratorDeallocate(void *object);


#endif /* defined(__MRFHuman__MRFLinkedListEnumerator__) */
