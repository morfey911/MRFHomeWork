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
    MRFHuman *_father;
    MRFHuman *_mother;
    MRFHuman *_children[20];
    char *_name;
    gender _sex;
    uint8_t _age;
    int _childrenCount;
    bool _isMarried;
};

#pragma mark -
#pragma mark Public Implementation

MRFHuman *MRFHumanCreate(char *name, gender gender, uint8_t age) {
    MRFHuman *newHuman = calloc(1, sizeof(MRFHuman));
    
    assert(NULL != newHuman);
    
    MRFHumanSetName(newHuman, name);
    MRFHumanSetGender(newHuman, gender);
    MRFHumanSetAge(newHuman, age);
    
    return newHuman;
}

void MRFHumanPrint(MRFHuman *object) {
    printf("Name: '%s'  ", MRFHumanGetName(object));
    printf("Gender: '%d'  ", (MRFHumanGetGender(object) == male) ? male : female);
    (NULL == MRFHumanGetPartner(object)) ? printf("Partner: 'no' ") : printf("Partner '%s' ", MRFHumanGetName(MRFHumanGetPartner(object)));
    printf("Age: '%d'\n", MRFHumanGetAge(object));
}

void MRFHumanGetMarried(MRFHuman *object, MRFHuman *partner) {
    if (NULL != object || NULL != partner) {
        MRFHumanSetIsMarried(object, true);
        MRFHumanSetPartner(object, partner);
        MRFHumanSetIsMarried(partner, true);
        MRFHumanSetPartner(partner, object);
    }
}

void MRFHumanDivorce(MRFHuman *object) {
    if (NULL != object) {
        MRFHumanSetIsMarried(object, false);
        MRFHumanSetIsMarried(MRFHumanGetPartner(object), false);
        MRFHumanSetPartner(MRFHumanGetPartner(object), NULL);
        MRFHumanSetPartner(object, NULL);
    }
}

void MRFHumanCreateChildren(MRFHuman *mother, MRFHuman *father) {
    if (NULL != mother && NULL != father) {
        uint8_t randomGender = rand() % 2;
        
        if (randomGender == 0) {
            randomGender += 1;
        }
        
        MRFHuman *newChildren = MRFHumanCreate(NULL, randomGender, 0);
        assert(NULL != newChildren);
        
        MRFHumanSetMother(newChildren, mother);
        MRFHumanSetFather(newChildren, father);
        MRFHumanSetChildren(mother, father, newChildren);
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

void MRFHumanSetChildren(MRFHuman *mother, MRFHuman *father, MRFHuman *children) {
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

void MRFHumanSetName(MRFHuman *object, char *name) {
    if (NULL != object && NULL != name) {
        object->_name = name;
    }
}

char *MRFHumanGetName(MRFHuman *object) {
    return object->_name;
}

void MRFHumanSetGender(MRFHuman *object, gender gender) {
    if (NULL != object) {
        object->_sex = gender;
    }
}

gender MRFHumanGetGender(MRFHuman *object) {
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

void MRFHumanSetIsMarried(MRFHuman *object, bool married) {
    if (NULL != object) {
        object->_isMarried = married;
    }
}

bool MRFHumanGetIsMarried(MRFHuman *object) {
    return object->_isMarried;
}

int MRFHumanGetChildrenCount(MRFHuman *object) {
    return object->_childrenCount;
}

