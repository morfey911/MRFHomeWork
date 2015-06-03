//
//  MRFString.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 01.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFString__
#define __MRFHuman__MRFString__

#include <stdio.h>
#include <stdbool.h>

#include "MRFObject.h"

typedef struct {
    MRFObject _super;
    
    char *_string;
    size_t _length;
} MRFString;

extern
MRFString *MRFStringCreateWithString(char *string);

extern
char *MRFStringGetString(MRFString *object);

extern
uint64_t MRFStringGetLength(MRFString *object);

extern
bool MRFStringIsEmpty(MRFString *object);

#endif /* defined(__MRFHuman__MRFString__) */
