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
    //  after MRFAutoReleasePool was created
    MRFAutoReleasePool *pool = MRFAutoReleasePoolCreate();
    
    //  and after object was created
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    //  additional retain
    MRFObjectRetain(object);
    
    //  after adding MRFObject in pool
    MRFAutoReleasePoolAddObject(pool, object);
    
    // retain count for MRFObject must be equal 2
    assert(2 == MRFObjectGetReferenceCount(object));
    
    //  after draining the pool
    MRFAutoReleasePoolDrain(pool);
    
    //  retain count should decrement
    assert(1 == MRFObjectGetReferenceCount(object));
    
    MRFObjectRelease(object);
}

void MRFAutoReleasePoolMultipleStacksAndMultipleObjectsTest() {
    //  after MRFAutoReleasePool was created
    MRFAutoReleasePool *pool = MRFAutoReleasePoolCreate();
    
    //  and after object was created
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    //  after adding MRFObject multiple times
    for (int i = 0; i < 5 * 512 - 1; i++) {
        MRFAutoReleasePoolAddObject(pool, object);
    }
    
    //  and after pool draining
    MRFAutoReleasePoolDrain(pool);
    
    //  creating another pool
    MRFAutoReleasePool *pool2 = MRFAutoReleasePoolCreate();
    
    for (int i = 0; i < 255 * 512 - 1; i++) {
        MRFAutoReleasePoolAddObject(pool2, object);
    }
    
    MRFAutoReleasePoolDrain(pool2);
    
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
