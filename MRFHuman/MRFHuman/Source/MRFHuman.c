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

void MRFHumanSet_partner(MRFHuman *object, MRFHuman *partner) {
    object->_partner = partner;
}

void MRFHumanSet_parents(MRFHuman *object, MRFHuman *parents) {
    *(object->_parents) = parents;
}

void MRFHumanSet_children(MRFHuman *object, MRFHuman *children) {
    *(object->_children) = children;
}

void MRFHumanSet_name(MRFHuman *object, char *name) {
    object->_name = name;
}

void MRFHumanSet_gender(MRFHuman *object, gender gender) {
    object->_sex = gender;
}

void MRFHumanSet_age(MRFHuman *object, int age) {
    object->_age = age;
}

void MRFHumanSet_isMarried(MRFHuman *object, bool married) {
    object->_isMarried = married;
}


MRFHuman *MRFHumanGet_partner(MRFHuman *object) {
    return object->_partner;
}

MRFHuman *MRFHumanGet_parents(MRFHuman *object) {
    return *(object->_parents);
}

MRFHuman *MRFHumanGet_children(MRFHuman *object) {
    return *(object->_children);
}

char *MRFHumanGet_name(MRFHuman *object) {
    return object->_name;
}

gender *MRFHumanGet_gender(MRFHuman *object) {
    return &object->_sex;
}

int MRFHumanGet_age(MRFHuman *object) {
    return object->_age;
}

int MRFHumanGet_childrenCount(MRFHuman *object) {
    return object->_childrenCount;
}

bool MRFHumanGet_isMarried(MRFHuman *object) {
    return object->_isMarried;
}
