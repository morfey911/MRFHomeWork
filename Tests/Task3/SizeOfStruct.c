//
//  SizeOfStruct.c
//  MRFHomeWork
//
//  Created by Yurii Mamurko on 10.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdio.h>

#include "SizeOfStruct.h"
#include "Task3Structs.h"

#define MRFSizeOfStruct(struct) \
printf("SizeOf "#struct " = " "%lu\n", sizeof(struct));

#pragma mark -
#pragma mark Public Implementations

void MRFSizeOfStructsTest() {
    MRFSizeOfStruct(struct unsortedStruct);
    MRFSizeOfStruct(struct sortedStruct);
    MRFSizeOfStruct(struct sortedStructWithUnion);
}