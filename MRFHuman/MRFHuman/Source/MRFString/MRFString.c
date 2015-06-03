//
//  MRFString.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 01.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <string.h>
#include <stdlib.h>

#include "MRFString.h"

#pragma mark -
#pragma mark Private Declarations

void MRFStringSetLength(MRFString *object, size_t length);

void MRFStringSetString(MRFString *object, char *string);

#pragma mark -
#pragma mark Public

void __MRFStringDeallocate(void *object) {
    MRFStringSetLength(object, 0);
    
    __MRFObjectDeallocate(object);
}

MRFString *MRFStringCreateWithString(char *string) {
    MRFString *newString = MRFObjectCreateOfType(MRFString);
    
    MRFStringSetString(newString, string);
    
    return newString;
}

char *MRFStringGetString(MRFString *object) {
    return (NULL != object) ? object->_string : NULL;
}

uint64_t MRFStringGetLength(MRFString *object) {
    return (NULL != object) ? object->_length : 0;
}

bool MRFStringIsEmpty(MRFString *object) {
    return (NULL != object) ? MRFStringGetLength(object) : false;
}

#pragma mark -
#pragma mark Private Implementations

void MRFStringSetLength(MRFString *object, size_t length) {
    if (NULL != object && object->_length != length) {
        if (0 == length && NULL != object->_string) {
            free(object->_string);
            object->_string = NULL;
        }
        object->_string = calloc(length, sizeof(char));
        object->_length = length;
    }
}

void MRFStringSetString(MRFString *object, char *string) {
    if (NULL != object) {
        MRFStringSetLength(object, strlen(string));
        object->_string = strdup(string);
    }
}
