//
//  MRFArrayTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 24.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//
#include <assert.h>

#include "MRFArrayTests.h"
#include "MRFArray.h"
#include "MRFHuman.h"

#pragma mark -
#pragma mark Private Declarations

static
void MRFArrayOneObjectBehaviourTest();

static
void MRFArrayMultipleObjectBehaviourTest();

#pragma mark -
#pragma mark Public

void MRFArrayTests() {
    MRFArrayOneObjectBehaviourTest();
    MRFArrayMultipleObjectBehaviourTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFArrayOneObjectBehaviourTest() {
    //  after array was created
    MRFArray *testArray = MRFArrayCreateWithCapacity(20);
//    MRFArray *testArray = MRFObjectCreateOfType(MRFArray);
    //      array must not be NULL
    assert(NULL != testArray);
    
    //      array retain count must be equal 1
    assert(1 == MRFObjectGetReferenceCount(testArray));
    
    //      array objects count must be equal 0
    assert(0 == MRFArrayGetCount(testArray));
    
    // after object was created
    MRFHuman *petya = MRFHumanCreateWithParameters("Petya", kMRFHumanMale, 8);
    
    //      object must not be NULL
    assert(NULL != petya);
    
    //      object reference count must be equal to 1
    assert(MRFObjectGetReferenceCount(petya));
    
    //      object index in array must be invalid (object not found)
    assert(false == MRFArrayContainsObject(testArray, petya));
    
    // after object was added to array
    MRFArrayAddObject(testArray, petya);
    
    //      array count must be equal to 1
    assert(1 == MRFArrayGetCount(testArray));
    
    //      array reference count must not change
    assert(1 == MRFObjectGetReferenceCount(testArray));
    
    //      object index in array must be 0
    assert(0 == MRFArrayGetIndexOfObject(testArray, petya));
    
    //      object reference count must be incremented by 1
    assert(2 == MRFObjectGetReferenceCount(petya));
    
    //      array object at index 0 must be equal to added object
    assert(petya == MRFArrayGetObjectAtIndex(testArray, 0));
    
    //      array must contain an object
    assert(true == MRFArrayContainsObject(testArray, petya));
    
    // after object was removed from array
    MRFArrayRemoveObjectAtIndex(testArray, 0);
    
    //      array count must be equal to 0
    assert(0 == MRFArrayGetCount(testArray));
    
    //      array reference count must not change
    assert(1 == MRFObjectGetReferenceCount(testArray));
    
    //      object index in array must be invalid (object not found)
    assert(-1 == MRFArrayGetIndexOfObject(testArray, petya));
    
    //      object reference count must be decremented by 1
    assert(1 == MRFObjectGetReferenceCount(petya));
    
    //      array must not contain an object
    assert(false == MRFArrayContainsObject(testArray, petya));
    
    MRFObjectRelease(petya);
    MRFObjectRelease(testArray);
    
}

void MRFArrayMultipleObjectBehaviourTest() {
    MRFArray *testArray = MRFArrayCreateWithCapacity(10);
    MRFHuman *originObject = MRFHumanCreateWithParameters("Masha", kMRFHumanFemale, 10);
    MRFHuman *object2 = MRFHumanCreateWithParameters("Kolya", kMRFHumanMale, 12);
    
    //  after one origin object was added 5 times in array
    for (int i = 0; i < 5; i++) {
        MRFArrayAddObject(testArray, originObject);
    }
    
    //      array count must be equal to 5
    assert(5 == MRFArrayGetCount(testArray));
    
    //      objects at indices 0 - 4 must be equal to object
    for (uint64_t i = 0; i < MRFArrayGetCount(testArray); i++) {
        assert(originObject == MRFArrayGetObjectAtIndex(testArray, i));
    }
    
    //  after added another object2 (not equal to origin object)
    MRFArrayAddObject(testArray, object2);
    
    //      array count must be equal to 6
    assert(6 == MRFArrayGetCount(testArray));
    
    //      objects at indices 0 - 4 must be equal to origin object
    for (uint64_t i = 0; i < 5; i++) {
        assert(originObject == MRFArrayGetObjectAtIndex(testArray, i));
    }
    
    //      added object2 must be at index 5
    assert(5 == MRFArrayGetIndexOfObject(testArray, object2));
    
    // after object at index 3 was removed
    MRFArrayRemoveObjectAtIndex(testArray, 3);
    
    //      array count must be equal to 5
    assert(5 == MRFArrayGetCount(testArray));
    
    //      objects at indices 0 - 3 must be equal to origin object
    for (uint64_t i = 0; i < 4; i++) {
        assert(originObject == MRFArrayGetObjectAtIndex(testArray, i));
    }
    
    //      added object2 must be at index 4
    assert(object2 == MRFArrayGetObjectAtIndex(testArray, 4));
    
    // after removing all object from array
    MRFArrayRemoveAllObjects(testArray);
    
    //      array must be empty
    assert(0 == MRFArrayGetCount(testArray));
    
    //      array must no contain origin object and object2
    assert(false == MRFArrayContainsObject(testArray, originObject));
    assert(false == MRFArrayContainsObject(testArray, object2));
    
    MRFObjectRelease(object2);
    MRFObjectRelease(originObject);
    MRFObjectRelease(testArray);
}