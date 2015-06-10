//
//  MRFLinkedListTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <assert.h>

#include "MRFLinkedListTests.h"
#include "MRFObject.h"
#include "MRFLinkedList.h"

#pragma mark -
#pragma mark Private Declarations

void MRFLinkedListBehaviourTest();

void MRFLinkedListEnumeratorBehaviourTest();

#pragma mark -
#pragma mark Public

void MRFLinkedListTests() {
    MRFLinkedListBehaviourTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFLinkedListBehaviourTest() {
    //  after list was created
    MRFLinkedList *list = MRFObjectCreateOfType(MRFLinkedList);
    
    //      list should be empty
    assert(true == MRFLinkedListIsEmpty(list));
    
    //  after object was created
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    //      list must not contain object
    assert(false == MRFLinkedListContainsObject(list, object));
    
    //  after object was added to list
    MRFLinkedListAddObject(list, object);
    
    //      object referenceCount must be 2
    assert(2 == MRFObjectGetReferenceCount(object));
    
    //      list must not be empty
    assert(false == MRFLinkedListIsEmpty(list));
    
    //      list must contain object
    assert(true == MRFLinkedListContainsObject(list, object));
    
    //  after object was removed from list
    MRFLinkedListRemoveObject(list, object);

    //      list should be empty
    assert(true == MRFLinkedListIsEmpty(list));

    //      list must not contain object
    assert(false == MRFLinkedListContainsObject(list, object));

    //      object referenceCount must be 1
    assert(1 == MRFObjectGetReferenceCount(object));

    // after object was added 20 times
    for (uint64_t iterator = 0; iterator < 2000; iterator++) {
        MRFLinkedListAddObject(list, object);
    }
    
    //      list must not be empty
    assert(false == MRFLinkedListIsEmpty(list));
    
    //      list must contain object
    assert(true == MRFLinkedListContainsObject(list, object));
    
    //      object referenceCount must be 2001
    assert(2001 == MRFObjectGetReferenceCount(object));
    
    // after object was removed from list
    MRFLinkedListRemoveFirstObject(list);
    
    //      object referenceCount must be 2000
    assert(2000 == MRFObjectGetReferenceCount(object));
    
    // after object was removed from list
    MRFLinkedListRemoveObject(list, object);
    
    
    //      object referenceCount must be 1
    assert(1 == MRFObjectGetReferenceCount(object));
    
    //      list should be empty
    assert(true == MRFLinkedListIsEmpty(list));
    
    //      list must not contain object
    assert(false == MRFLinkedListContainsObject(list, object));
    
    MRFObjectRelease(object);
    MRFObjectRelease(list);
}

void MRFLinkedListEnumeratorBehaviourTest() {
    
}
