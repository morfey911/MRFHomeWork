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
#include "MRFObject.h"

#pragma mark -
#pragma mark Private Declaration

struct MRFHuman {
    MRFObject _super;
    
    MRFHuman *_partner;
    MRFHuman *_father;
    MRFHuman *_mother;
    MRFHuman *_children[20];
    char *_name;
    MRFGender _sex;
    uint8_t _age;
    int _childrenCount;
};

static
void MRFHumanSetPartner(MRFHuman *object, MRFHuman *partner);

static
void MRFHumanSetFather(MRFHuman *object, MRFHuman *father);

static
void MRFHumanSetMother(MRFHuman *object, MRFHuman *mother);

static
uint8_t MRFHumanRandomGender();

#pragma mark -
#pragma mark Public Implementation

void __MRFHumanDeallocate(void *object) {
    __MRFObjectDeallocate(object);
}

MRFHuman *MRFHumanCreateWithParameters(char *name, MRFGender gender, uint8_t age) {
    MRFHuman *newHuman = MRFObjectCreateOfType(MRFHuman);
    
    MRFHumanSetName(newHuman, name);
    MRFHumanSetGender(newHuman, gender);
    MRFHumanSetAge(newHuman, age);
    
    return newHuman;
}

MRFHuman *MRFHumanCreateChildren(MRFHuman *mother, MRFHuman *father) {
    if (NULL != mother && NULL != father) {
        
        MRFHuman *newChild = MRFHumanCreateWithParameters(NULL, MRFHumanRandomGender(), 0);
        assert(NULL != newChild);
        
        MRFHumanSetMother(newChild, mother);
        MRFHumanSetFather(newChild, father);
        MRFHumanAddChild(mother, father, newChild);
        
        return newChild;
    }
    return 0;
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

void MRFHumanSetPartner(MRFHuman *object, MRFHuman *partner) {
    if (NULL != object) {
        (partner != NULL) ? MRFObjectRetain(partner) : MRFObjectRelease(partner);
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

void MRFHumanAddChild(MRFHuman *mother, MRFHuman *father, MRFHuman *child) {
    if (NULL != mother && NULL != father && NULL != child) {
        if (father->_childrenCount <= 20 && mother->_childrenCount <= 20) {
            mother->_children[mother->_childrenCount] = child;
            father->_children[father->_childrenCount] = child;
            mother->_childrenCount += 1;
            father->_childrenCount += 1;
        }
    }
}

MRFHuman *MRFHumanGetFirstChild(MRFHuman *object) {
    return *(object->_children);
}

MRFHuman *MRFHumanGetChildAtIndex(MRFHuman *object, uint8_t index) {
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

bool MRFHumanIsMarried(MRFHuman *object) {
    return (object->_partner != NULL) ? true : false;
}

int MRFHumanGetChildrenCount(MRFHuman *object) {
    return object->_childrenCount;
}

uint8_t MRFHumanRandomGender() {
    uint8_t randomGender = rand() % 3;
    
    return (randomGender == 0) ? randomGender += 1 : randomGender;
}