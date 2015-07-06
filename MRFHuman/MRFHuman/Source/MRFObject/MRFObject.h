//
//  MRFObject.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 18.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFObject__
#define __MRFHuman__MRFObject__

#include <stdlib.h>

typedef void (*MRFObjectDeallocatorCallback)(void *);

typedef struct {
    uint64_t _referenceCount;
    MRFObjectDeallocatorCallback _deallocator;
} MRFObject;

extern
void *__MRFObjectCreate(size_t objectSize, MRFObjectDeallocatorCallback deallocateCallback);

#define MRFObjectCreateOfType(type) \
__MRFObjectCreate(sizeof(type), (MRFObjectDeallocatorCallback)__##type##Deallocate)

extern
void *MRFObjectRetain(void *object);

extern
void MRFObjectRelease(void *object);

extern
uint64_t MRFObjectGetReferenceCount(void *object);

extern
void __MRFObjectDeallocate(void *object);

#endif /* defined(__MRFHuman__MRFObject__) */
