//
//  MRFAutoReleaseStackTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>
#include <stdio.h>

#include "MRFAutoReleaseStackTests.h"
#include "MRFAutoReleaseStack.h"

#pragma mark -
#pragma mark Private Declarations

void MRFAutoReleaseStackBehaviourTest();

void MRFAutoReleaseStackPerfomTest();

#pragma mark -
#pragma mark Public

void MRFAutoReleaseStackTests() {
    MRFAutoReleaseStackPerfomTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFAutoReleaseStackBehaviourTest() {
    //  after creating MRFAutoReleaseStack with size equals 10
    MRFAutoReleaseStack *stack = MRFAutoReleaseStackCreateWithSize(10);
    
    //  stack must be empty
    assert(MRFAutoReleaseStackIsEmpty(stack));
    
    //  after adding object
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    MRFAutoReleaseStackPush(stack, object);
    
    //  stack count must be equals 1
    assert(1 == MRFAutoReleaseStackGetCount(stack));
    
    //  retain count of object must be equals 1
    assert(1 == MRFObjectGetReferenceCount(object));
    
    //  stack should't be empty
    assert(false == MRFAutoReleaseStackIsEmpty(stack));
    
    //  after adding object 5 times
    for (int i = 0; i < 5; i++) {
        MRFAutoReleaseStackPush(stack, object);
    }
    
    //  stack count must be equals 6
    assert(6 == MRFAutoReleaseStackGetCount(stack));
    
    //  retain count for object must be equal 1
    assert(1 == MRFObjectGetReferenceCount(object));
    
    //  after adding NULL
    MRFAutoReleaseStackPush(stack, NULL);
    
    //  stack count must be equals 7
    assert(7 == MRFAutoReleaseStackGetCount(stack));
    
    //  after adding object one more time
    MRFAutoReleaseStackPush(stack, object);
    
    //  stack count must be equals 8
    assert(8 == MRFAutoReleaseStackGetCount(stack));
    
    MRFObjectRelease(object);
    MRFObjectRelease(stack);
}

void MRFAutoReleaseStackPerfomTest() {
    printf("MRFAutoReleaseStackPerfomTest\n");
    MRFAutoReleaseStackBehaviourTest();
}
