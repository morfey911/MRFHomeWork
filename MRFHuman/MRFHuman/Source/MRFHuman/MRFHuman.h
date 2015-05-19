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

typedef enum {
    kMRFHumanUndefined,
    kMRFHumanMale,
    kMRFHumanFemale
} MRFGender;

typedef struct MRFHuman MRFHuman;

extern
MRFHuman *MRFHumanCreate(char *name, MRFGender gender, uint8_t age);

extern
void MRFHumanPrintDescription(MRFHuman *object);

extern
void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner); //проверить object == partner

extern
void MRFHumanDivorce(MRFHuman *object);

extern
void MRFHumanCreateChildren(MRFHuman *mother, MRFHuman *father);

#pragma mark -
#pragma mark Accessors

extern
void MRFHumanSetPartner(MRFHuman *object, MRFHuman *partner);

extern
MRFHuman *MRFHumanGetPartner(MRFHuman *object);

extern
void MRFHumanSetFather(MRFHuman *object, MRFHuman *father);

extern
MRFHuman *MRFHumanGetFather(MRFHuman *object);

extern
void MRFHumanSetMother(MRFHuman *object, MRFHuman *mother);

extern
MRFHuman *MRFHumanGetMother(MRFHuman *object);

extern
void MRFHumanAddChildren(MRFHuman *mother, MRFHuman *father, MRFHuman *children);

extern
MRFHuman *MRFHumanGetChildren(MRFHuman *object);

extern
MRFHuman *MRFHumanGetChildrenAtIndex(MRFHuman *object, uint8_t index);

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
bool MRFHumanGetIsMarried(MRFHuman *object);

extern
int MRFHumanGetChildrenCount(MRFHuman *object);

#endif /* defined(__MRFHuman__MRFHuman__) */
