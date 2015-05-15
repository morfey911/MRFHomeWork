//
//  MRFHuman.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 12.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include "MRFHuman.h"

#pragma mark -
#pragma mark Private Declaration

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

#pragma mark -
#pragma mark Public Implementation

MRFHuman *MRFHumanCreate(char *name, gender gender, int age) {
    MRFHuman *newHuman = calloc(1, sizeof(MRFHuman));
    
    assert(NULL != newHuman);
    
    newHuman->_name = name;
    newHuman->_sex = gender;
    newHuman->_age = age;
    
    return newHuman;
}

void MRFHumanPrint(MRFHuman *object) {
    printf("Name: '%s'  ", object->_name);
    printf("Gender: '%d'  ", (object->_sex == male) ? male : female);
    (NULL == object->_partner) ? printf("Partner: 'no' ") : printf("Partner '%s' ", object->_partner->_name);
    printf("Age: '%d'\n", object->_age);
}

void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner) {
    object->_isMarried = true;
    object->_partner = partner;
    partner->_isMarried = true;
    partner->_partner = object;
}

void MRFHumanDivorce(MRFHuman *object) {
    object->_isMarried = false;
    object->_partner->_isMarried = false;
    object->_partner->_partner = NULL;
    object->_partner = NULL;
}

void MRFHumanSetPartner(MRFHuman *object, MRFHuman *partner) {
    object->_partner = partner;
}

MRFHuman *MRFHumanGetPartner(MRFHuman *object) {
    return object->_partner;
}

void MRFHumanSetParents(MRFHuman *object, MRFHuman *parents) {
    *(object->_parents) = parents;
}

MRFHuman *MRFHumanGetParents(MRFHuman *object) {
    return *(object->_parents);
}

void MRFHumanSetChildren(MRFHuman *object, MRFHuman *children) {
    *(object->_children) = children;
}

MRFHuman *MRFHumanGetChildren(MRFHuman *object) {
    return *(object->_children);
}

void MRFHumanSetName(MRFHuman *object, char *name) {
    object->_name = name;
}

char *MRFHumanGetName(MRFHuman *object) {
    return object->_name;
}

void MRFHumanSetGender(MRFHuman *object, gender gender) {
    object->_sex = gender;
}

gender MRFHumanGetGender(MRFHuman *object) {
    return object->_sex;
}

void MRFHumanSetAge(MRFHuman *object, int age) {
    object->_age = age;
}

int MRFHumanGetAge(MRFHuman *object) {
    return object->_age;
}

void MRFHumanSetIsMarried(MRFHuman *object, bool married) {
    object->_isMarried = married;
}

bool MRFHumanGetIsMarried(MRFHuman *object) {
    return object->_isMarried;
}

int MRFHumanGetChildrenCount(MRFHuman *object) {
    return object->_childrenCount;
}

