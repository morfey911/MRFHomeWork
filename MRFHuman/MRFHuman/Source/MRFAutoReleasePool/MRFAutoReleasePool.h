//
//  MRFAutoReleasePool.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 11.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFAutoReleasePool__
#define __MRFHuman__MRFAutoReleasePool__

#include "MRFAutoReleasingStack.h"
#include "MRFLinkedList.h"
#include "MRFObject.h"

typedef struct {
    MRFObject _super;
    
    MRFLinkedList *_list;
    MRFAutoReleasingStack *_currentStack;
    uint64_t _emptyStacksCount;
} MRFAutoReleasePool;

extern
MRFAutoReleasePool *MRFAutoReleasePoolCreate();

extern
void MRFAutoReleasePoolAddObject(MRFAutoReleasePool *pool, void *object);

extern
void MRFAutoReleasePoolDrain(MRFAutoReleasePool *pool);

#endif /* defined(__MRFHuman__MRFAutoReleasePool__) */
