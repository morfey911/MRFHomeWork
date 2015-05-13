//
//  OffsetOfStructsTest.c
//  MRFHomeWork
//
//  Created by Yurii Mamurko on 11.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include "OffsetOfStructsTest.h"

#define MRFOffsetOf(struct, variable) printf("%lu\n", offsetof(struct, variable));

#pragma mark -
#pragma mark Public Implementations

void OffsetOfStructsTest() {
    MRFOffsetOf(unsortedStruct, someBool2);
    MRFOffsetOf(unsortedStruct, someBool3);
    MRFOffsetOf(unsortedStruct, someBool6);
    MRFOffsetOf(unsortedStruct, someFloat);
    MRFOffsetOf(unsortedStruct, someInt);
    MRFOffsetOf(unsortedStruct, someLL);
    MRFOffsetOf(unsortedStruct, someBool5);
    MRFOffsetOf(unsortedStruct, someShort1);
    MRFOffsetOf(unsortedStruct, someBool1);
    MRFOffsetOf(unsortedStruct, someShort2);
    MRFOffsetOf(unsortedStruct, someShort3);
    MRFOffsetOf(unsortedStruct, someBool4);
    MRFOffsetOf(unsortedStruct, someDouble);
    MRFOffsetOf(unsortedStruct, someString);

}