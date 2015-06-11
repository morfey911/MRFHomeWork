//
//  MRFAutoReleasePool.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 11.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include "MRFAutoReleasePool.h"

#pragma mark -
#pragma mark Private Declarations

static MRFAutoReleasePool *__pool = NULL;

#pragma mark -
#pragma mark Public

MRFAutoReleasePool *MRFAutoReleasePoolCreate();

void MRFAutoReleasePoolAddObject(MRFAutoReleasePool *pool, void *object);

void MRFAutoReleasePoolDrain(MRFAutoReleasePool *pool);

void __MRFAutoReleasePoolDeallocate(void *object);

#pragma mark -
#pragma mark Private Implementations