//
//  MRFStringTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 02.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFStringTests.h"
#include "MRFString.h"

#pragma mark -
#pragma mark Private Declarations

void MRFStringBehaviourTest();

#pragma mark -
#pragma mark Public

void MRFStringTests() {
    MRFStringBehaviourTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFStringBehaviourTest() {
    //after object was created
    MRFString *string = MRFStringCreateWithString("Hello");
    MRFString *emptyString = MRFStringCreateWithString("");
    
    //string must not be NULL
    assert(NULL != string);
    assert(NULL != emptyString);
    
    //string must not be empty and empty for emptyString
    assert(true == MRFStringIsEmpty(string));
    assert(false == MRFStringIsEmpty(emptyString));
    
    //string retain count must be 1
    assert(1 == MRFObjectGetReferenceCount(string));
    assert(1 == MRFObjectGetReferenceCount(emptyString));
    
    //string length must be 5 and 0 for emptyString
    assert(5 == MRFStringGetLength(string));
    assert(0 == MRFStringGetLength(emptyString));
    
    //string must not be equal to emptyString
    assert(emptyString != string);
    
    MRFObjectRelease(emptyString);
    MRFObjectRelease(string);
}
