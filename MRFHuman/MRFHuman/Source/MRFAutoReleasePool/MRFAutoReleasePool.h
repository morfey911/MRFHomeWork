//
//  MRFAutoReleasePool.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 11.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFAutoReleasePool__
#define __MRFHuman__MRFAutoReleasePool__

#include "MRFLinkedList.h"
#include "MRFObject.h"

typedef struct {
    MRFObject _super;
    
    MRFLinkedList *_list;
} MRFAutoReleasePool;

extern
MRFAutoReleasePool *MRFAutoReleasePoolCreate();

extern
void MRFAutoReleasePoolAddObject(MRFAutoReleasePool *pool, void *object);

extern
void MRFAutoReleasePoolDrain(MRFAutoReleasePool *pool);

extern
void __MRFAutoReleasePoolDeallocate(void *object);

#endif /* defined(__MRFHuman__MRFAutoReleasePool__) */
