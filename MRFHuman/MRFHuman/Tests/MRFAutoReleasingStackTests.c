//
//  MRFAutoReleasingStackTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>
#include <stdio.h>

#include "MRFAutoReleasingStackTests.h"
#include "MRFAutoReleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

void MRFAutoReleasingStackBehaviourTest();

void MRFAutoReleasingStackPerfomTest();

#pragma mark -
#pragma mark Public

void MRFAutoReleasingStackTests() {
    MRFAutoReleasingStackPerfomTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFAutoReleasingStackBehaviourTest() {
    //  after creating MRFAutoReleasingStack with size equals 10
    MRFAutoReleasingStack *stack = MRFAutoReleasingStackCreateWithSize(10);
    
    //  stack must be empty
    assert(MRFAutoReleasingStackIsEmpty(stack));
    
    //  after adding object
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    MRFAutoReleasingStackPushObject(stack, NULL);
    
    //  stack count must be equals 1
    assert(1 == MRFAutoReleasingStackGetCount(stack));
    
    //  retain count of object must be equals 1
    assert(1 == MRFObjectGetReferenceCount(object));
    
    //  stack should't be empty
    assert(false == MRFAutoReleasingStackIsEmpty(stack));
    
    //  after adding object 5 times
    for (int i = 0; i < 5; i++) {
        MRFAutoReleasingStackPushObject(stack, object);
    }
    
    //  stack count must be equals 6
    assert(6 == MRFAutoReleasingStackGetCount(stack));
    
    //  retain count for object must be equal 1
    assert(1 == MRFObjectGetReferenceCount(object));
    
    //  after adding NULL
    MRFAutoReleasingStackPushObject(stack, NULL);
    
    //  stack count must be equals 7
    assert(7 == MRFAutoReleasingStackGetCount(stack));
    
    //  after adding 3 more objects
    for (int i = 0; i < 3; i++) {
        MRFAutoReleasingStackPushObject(stack, object);
    }
    
    //  stack count must be equals 10
    assert(10 == MRFAutoReleasingStackGetCount(stack));
    
    //  stack must be full
    assert(true == MRFAutoReleasingStackIsFull(stack));
    
    //  MRFAutoReleasingStackPop must return MRFAutoReleasingStackObject for 3 last objects
    for (int i = 0; i < 3; i++) {
        assert(MRFAutoReleasingStackPoppingObject == MRFAutoReleasingStackPopObject(stack));
    }
    
    //  next return must be MRFAutoReleasingStackNULL
    assert(MRFAutoReleasingStackPoppingNULL == MRFAutoReleasingStackPopObject(stack));
    
    //  after poping all objects from stack
    MRFAutoReleasingStackPopAllObjects(stack);
    
    //  stack must be empty
    assert(true == MRFAutoReleasingStackIsEmpty(stack));
    
    //  just release them all
    MRFObjectRelease(object);
    MRFObjectRelease(stack);
}

void MRFAutoReleasingStackPerfomTest() {
    printf("MRFAutoReleasingStackPerfomTest\n");
    MRFAutoReleasingStackBehaviourTest();
}
