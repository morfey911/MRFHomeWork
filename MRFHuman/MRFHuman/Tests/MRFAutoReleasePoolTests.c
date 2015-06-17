//
//  MRFAutoReleasePoolTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 16.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>
#include <stdio.h>

#include "MRFObject.h"
#include "MRFAutoReleasePool.h"
#include "MRFAutoReleasePoolTests.h"

#pragma mark -
#pragma mark Private Declarations

static
void MRFAutoReleasePoolOneStackAndOneObjectTest();

static
void MRFAutoReleasePoolMultipleStacksAndMultipleObjectsTest();

static
void MRFAutoReleasePoolOneStackWithMultiplePools();

static
void MRFAutoReleasePoolPerfomTest();

#pragma mark -
#pragma mark Public

void MRFAutoReleasePoolTests() {
    MRFAutoReleasePoolPerfomTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFAutoReleasePoolPerfomTest() {
    printf("MRFAutoReleasePoolPerfomTest");
    MRFAutoReleasePoolOneStackAndOneObjectTest();
    MRFAutoReleasePoolMultipleStacksAndMultipleObjectsTest();
    MRFAutoReleasePoolOneStackWithMultiplePools();
}

void MRFAutoReleasePoolOneStackAndOneObjectTest() {
    MRFAutoReleasePool *pool = MRFAutoReleasePoolCreate();
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    MRFObjectRetain(object);
    
    MRFAutoReleasePoolAddObject(pool, object);
    
    assert(2 == MRFObjectGetReferenceCount(object));
    
    MRFAutoReleasePoolDrain(pool);
    
    assert(1 == MRFObjectGetReferenceCount(object));
    
    MRFObjectRelease(object);
}

void MRFAutoReleasePoolMultipleStacksAndMultipleObjectsTest() {
    MRFAutoReleasePool *pool = MRFAutoReleasePoolCreate();
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    MRFObjectRetain(object);
    
    for (int i = 0; i < 110; i++) {
        MRFAutoReleasePoolAddObject(pool, object);
    }
    
    MRFAutoReleasePoolDrain(pool);
}

void MRFAutoReleasePoolOneStackWithMultiplePools() {
    MRFAutoReleasePool *pool1 = MRFAutoReleasePoolCreate();
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    assert(1 == MRFObjectGetReferenceCount(object));
    
    MRFAutoReleasePoolAddObject(pool1, object);
    
    assert(1 == MRFObjectGetReferenceCount(object));
    
    MRFAutoReleasePool *pool2 = MRFAutoReleasePoolCreate();
    
    MRFAutoReleasePoolAddObject(pool2, object);
    
    MRFAutoReleasePool *pool3 = MRFAutoReleasePoolCreate();
    
    MRFAutoReleasePoolAddObject(pool3, object);
    
    MRFAutoReleasePoolDrain(pool3);
    MRFAutoReleasePoolDrain(pool2);
    MRFAutoReleasePoolDrain(pool1);
}
