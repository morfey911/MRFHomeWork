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

struct MRFHuman {
    MRFHuman *_partner;
    MRFHuman *_parents[2];
    MRFHuman *_children[20];
    char *_name;
    gender _sex;
    int _age;
    int _childrenCount;
    bool _isMarried;
};

extern
MRFHuman *MRFHumanCreate(char *name, gender gender, int age);

extern
void MRFHumanPrint(MRFHuman *object);

extern
void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner);

extern
void MRFHumanDivorce(MRFHuman *object);

#pragma mark -
#pragma mark Setters

extern
void MRFHumanSet_partner(MRFHuman *object, MRFHuman *partner);

extern
void MRFHumanSet_parents(MRFHuman *object, MRFHuman *parents);

extern
void MRFHumanSet_children(MRFHuman *object, MRFHuman *children);

extern
void MRFHumanSet_name(MRFHuman *object, char *name);

extern
void MRFHumanSet_gender(MRFHuman *object, gender gender);

extern
void MRFHumanSet_age(MRFHuman *object, int age);

extern
void MRFHumanSet_isMarried(MRFHuman *object, bool married);

#pragma mark -
#pragma mark Getters

extern
MRFHuman *MRFHumanGet_partner(MRFHuman *object);

extern
MRFHuman *MRFHumanGet_parents(MRFHuman *object);

extern
MRFHuman *MRFHumanGet_children(MRFHuman *object);

extern
char *MRFHumanGet_name(MRFHuman *object);

extern
gender *MRFHumanGet_gender(MRFHuman *object);

extern
int MRFHumanGet_age(MRFHuman *object);

extern
int MRFHumanGet_childrenCount(MRFHuman *object);

extern
bool MRFHumanGet_isMarried(MRFHuman *object);

#endif /* defined(__MRFHuman__MRFHuman__) */
