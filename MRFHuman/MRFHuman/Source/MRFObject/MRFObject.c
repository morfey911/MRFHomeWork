//
//  MRFObject.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 18.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFObject.h"

void *__MRFObjectCreate(size_t objectSize, MRFObjectDeallocatorCallback deallocateCallback) {
    assert(0 != objectSize);
    
    MRFObject *object = calloc(1, objectSize);
    
    assert(NULL != object);
    
    object->_referenceCount = 1;
    object->_deallocator = deallocateCallback;
    
    return object;
}

void *MRFObjectRetain(void *object) {
    if (NULL != object) {
        ((MRFObject *)object)->_referenceCount++;
    }
    return object;
}

void MRFObjectRelease(void *object) {
    if (NULL != object) {
        uint64_t count = ((MRFObject *)object)->_referenceCount - 1;
        ((MRFObject *)object)->_referenceCount = count;
        
        if (0 == count) {
            ((MRFObject *)object)->_deallocator(object);
        }
    }
}

uint64_t MRFObjectGetReferenceCount(void *object) {
    return object ? ((MRFObject *)object)->_referenceCount : 0;
}

void __MRFObjectDeallocate(void *object) {
    free(object);
}