//
//  MRFHuman.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 12.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFHuman__
#define __MRFHuman__MRFHuman__

#include <stdbool.h>

#include "MRFArray.h"

typedef enum {
    kMRFHumanUndefined,
    kMRFHumanMale,
    kMRFHumanFemale
} MRFGender;

typedef struct MRFHuman MRFHuman;

extern
MRFHuman *MRFHumanCreateWithParameters(char *name, MRFGender gender, uint8_t age);

extern
MRFHuman *MRFHumanCreateChild(MRFHuman *mother, MRFHuman *father);

extern
void MRFHumanPrintDescription(MRFHuman *object);

extern
void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner);

extern
void MRFHumanDivorce(MRFHuman *object);

extern
void MRFHumanAddChild(MRFHuman *mother, MRFHuman *father, MRFHuman *child);

#pragma mark -
#pragma mark Accessors

extern
MRFHuman *MRFHumanGetPartner(MRFHuman *object);

extern
MRFHuman *MRFHumanGetFather(MRFHuman *object);

extern
MRFHuman *MRFHumanGetMother(MRFHuman *object);

extern
MRFArray *MRFHumanGetChildren(MRFHuman *object);

extern
MRFHuman *MRFHumanGetChildAtIndex(MRFHuman *object, uint8_t index);

extern
void MRFHumanSetName(MRFHuman *object, char *name);

extern
char *MRFHumanGetName(MRFHuman *object);

extern
void MRFHumanSetGender(MRFHuman *object, MRFGender gender);

extern
MRFGender MRFHumanGetGender(MRFHuman *object);

extern
void MRFHumanSetAge(MRFHuman *object, int age);

extern
int MRFHumanGetAge(MRFHuman *object);

extern
bool MRFHumanIsMarried(MRFHuman *object);

extern
int MRFHumanGetChildrenCount(MRFHuman *object);

#endif /* defined(__MRFHuman__MRFHuman__) */
