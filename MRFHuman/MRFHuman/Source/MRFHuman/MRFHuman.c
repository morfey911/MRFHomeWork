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
#include <string.h>

#include "MRFHuman.h"

#pragma mark -
#pragma mark Private Declaration

struct MRFHuman {
    MRFHuman *_partner;
    MRFHuman *_father;
    MRFHuman *_mother;
    MRFHuman *_children[20];
    char *_name;
    MRFGender _sex;
    uint8_t _age;
    int _childrenCount;
};

#pragma mark -
#pragma mark Public Implementation

MRFHuman *MRFHumanCreate(char *name, MRFGender gender, uint8_t age) {
    MRFHuman *newHuman = calloc(1, sizeof(MRFHuman));
    
    assert(NULL != newHuman);
    
    MRFHumanSetName(newHuman, name);
    MRFHumanSetGender(newHuman, gender);
    MRFHumanSetAge(newHuman, age);
    
    return newHuman;
}

void MRFHumanPrintDescription(MRFHuman *object) {
    printf("Name: '%s'  ", MRFHumanGetName(object));
    printf("Gender: '%d'  ", (MRFHumanGetGender(object) == kMRFHumanMale) ? kMRFHumanMale : kMRFHumanFemale);
    (NULL == MRFHumanGetPartner(object)) ? printf("Partner: 'no' ") : printf("Partner '%s' ", MRFHumanGetName(MRFHumanGetPartner(object)));
    printf("Age: '%d'\n", MRFHumanGetAge(object));
}

void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner) {
    if (NULL != object || NULL != partner) {
        if (object != partner) {
            MRFHumanSetPartner(object, partner);
            MRFHumanSetPartner(partner, object);
        }
    }
}

void MRFHumanDivorce(MRFHuman *object) {
    if (NULL != object) {
        MRFHumanSetPartner(MRFHumanGetPartner(object), NULL);
        MRFHumanSetPartner(object, NULL);
    }
}

void MRFHumanCreateChildren(MRFHuman *mother, MRFHuman *father) {
    if (NULL != mother && NULL != father) {
        uint8_t randomGender = rand() % 3;
        
        if (randomGender == 0) {
            randomGender += 1;
        }
        
        MRFHuman *newChildren = MRFHumanCreate(NULL, randomGender, 0);
        assert(NULL != newChildren);
        
        MRFHumanSetMother(newChildren, mother);
        MRFHumanSetFather(newChildren, father);
        MRFHumanAddChildren(mother, father, newChildren);
    }
}

void MRFHumanSetPartner(MRFHuman *object, MRFHuman *partner) {
    if (NULL != object) {
         object->_partner = partner;
    }
}

MRFHuman *MRFHumanGetPartner(MRFHuman *object) {
    return object->_partner;
}

void MRFHumanSetFather(MRFHuman *object, MRFHuman *father) {
    if (NULL != object && NULL != father) {
        object->_father = father;
    }
}

MRFHuman *MRFHumanGetFather(MRFHuman *object) {
    return object->_father;
}

void MRFHumanSetMother(MRFHuman *object, MRFHuman *mother) {
    if (NULL != object && NULL != mother) {
        object->_mother = mother;
    }
}

MRFHuman *MRFHumanGetMother(MRFHuman *object) {
    return object->_mother;
}

void MRFHumanAddChildren(MRFHuman *mother, MRFHuman *father, MRFHuman *children) {
    if (NULL != mother && NULL != father && NULL != children) {
        if (father->_childrenCount <= 20 && mother->_childrenCount <= 20) {
            mother->_children[mother->_childrenCount] = children;
            father->_children[father->_childrenCount] = children;
            mother->_childrenCount += 1;
            father->_childrenCount += 1;
        }
    }
}

MRFHuman *MRFHumanGetChildren(MRFHuman *object) {
    return *(object->_children);
}

MRFHuman *MRFHumanGetChildrenAtIndex(MRFHuman *object, uint8_t index) {
    return object->_children[index];
}

void MRFHumanSetName(MRFHuman *object, char *name) {
    if (NULL != object) {
        char *previousName = object->_name;
        if (NULL != previousName ) {
            free(previousName);
            object->_name = NULL;
        }
        if (NULL != name) {
            object->_name = strdup(name);
            
            assert(NULL != object->_name);
        }
    }
}

char *MRFHumanGetName(MRFHuman *object) {
    return object->_name;
}

void MRFHumanSetGender(MRFHuman *object, MRFGender gender) {
    if (NULL != object) {
        object->_sex = gender;
    }
}

MRFGender MRFHumanGetGender(MRFHuman *object) {
    return object->_sex;
}

void MRFHumanSetAge(MRFHuman *object, int age) {
    if (NULL != object) {
        object->_age = age;
    }
}

int MRFHumanGetAge(MRFHuman *object) {
    return object->_age;
}

bool MRFHumanGetIsMarried(MRFHuman *object) {
    return (object->_partner != NULL) ? true : false;
}

int MRFHumanGetChildrenCount(MRFHuman *object) {
    return object->_childrenCount;
}

