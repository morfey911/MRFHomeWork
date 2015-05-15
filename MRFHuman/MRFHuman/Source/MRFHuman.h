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
    undefined,
    male,
    female
} gender;

typedef struct MRFHuman MRFHuman;

extern
MRFHuman *MRFHumanCreate(char *name, gender gender, int age);

extern
void MRFHumanPrint(MRFHuman *object);

extern
void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner);

extern
void MRFHumanDivorce(MRFHuman *object);

#pragma mark -
#pragma mark Accessors

extern
void MRFHumanSetpartner(MRFHuman *object, MRFHuman *partner);

extern
MRFHuman *MRFHumanGetPartner(MRFHuman *object);

extern
void MRFHumanSetParents(MRFHuman *object, MRFHuman *parents);

extern
MRFHuman *MRFHumanGetParents(MRFHuman *object);

extern
void MRFHumanSetChildren(MRFHuman *object, MRFHuman *children);

extern
MRFHuman *MRFHumanGetChildren(MRFHuman *object);

extern
void MRFHumanSetName(MRFHuman *object, char *name);

extern
char *MRFHumanGetName(MRFHuman *object);

extern
void MRFHumanSetGender(MRFHuman *object, gender gender);

extern
gender MRFHumanGetGender(MRFHuman *object);

extern
void MRFHumanSetAge(MRFHuman *object, int age);

extern
int MRFHumanGetAge(MRFHuman *object);

extern
void MRFHumanSetIsMarried(MRFHuman *object, bool married);

extern
bool MRFHumanGetIsMarried(MRFHuman *object);

extern
int MRFHumanGetChildrenCount(MRFHuman *object);

#endif /* defined(__MRFHuman__MRFHuman__) */
