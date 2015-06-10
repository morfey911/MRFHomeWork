//
//  MRFLinkedListNodeTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 10.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "MRFObject.h"
#include "MRFLinkedListNodeTests.h"
#include "MRFLinkedListNode.h"

#pragma mark -
#pragma mark Private Declarations

void MRFLinkedListNodeCreateTest();

void MRFLinkedListNodePerfomTest();

#pragma mark -
#pragma mark Public

void MRFLinkedListNodeTests() {
    MRFLinkedListNodePerfomTest();
}

#pragma mark -
#pragma mark Private Implementations

void MRFLinkedListNodeCreateTest() {
    //  after object was created
    MRFObject *object = MRFObjectCreateOfType(MRFObject);
    
    //  after node and nextNode was created with object
    MRFLinkedListNode *node = MRFLinkedListNodeCreateWithObject(object);
    MRFLinkedListNode *nextNode = MRFLinkedListNodeCreateWithObject(object);
    
    //      retain count for object must be 3
    assert(3 == MRFObjectGetReferenceCount(object));
    
    //      node and nextNode must countain object
    assert(object == MRFLinkedListNodeGetObject(node));
    assert(object == MRFLinkedListNodeGetObject(nextNode));
    
    //      nextNode for node must be NULL
    assert(NULL == MRFLinkedListNodeGetNextNode(node));
    
    //      after set nextNode for node
    MRFLinkedListNodeSetNextNode(node, nextNode);
    
    //          nextNode pointer for node must be equal to nextNode object
    assert(nextNode == MRFLinkedListNodeGetNextNode(node));
    
    //  just release
    MRFObjectRelease(nextNode);
    MRFObjectRelease(node);
    MRFObjectRelease(object);
}

void MRFLinkedListNodePerfomTest() {
    printf("MRFLinkedListNodePerfomTest");
    MRFLinkedListNodeCreateTest();
}
