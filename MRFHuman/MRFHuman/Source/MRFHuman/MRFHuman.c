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
#include "MRFString.h"

#pragma mark -
#pragma mark Private Declaration

struct MRFHuman {
    MRFObject _super;
    
    MRFHuman *_partner;
    MRFHuman *_father;
    MRFHuman *_mother;
    MRFArray *_children;
    MRFString *_name;
    MRFGender _sex;
    uint8_t _age;
    int _childrenCount;
};

static
void MRFHumanSetChildren(MRFHuman *object, MRFArray *children);

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
    MRFHuman *human = object;
    
    MRFHumanDivorce(human);
    
    MRFArrayRemoveAllObjects(MRFHumanGetChildren(human));
    MRFHumanSetChildren(human, NULL);
    MRFHumanSetMother(human, NULL);
    MRFHumanSetFather(human, NULL);
    MRFHumanSetName(human, NULL);
    
    __MRFObjectDeallocate(object);
}

MRFHuman *MRFHumanCreateWithParameters(char *name, MRFGender gender, uint8_t age) {
    MRFHuman *newHuman = MRFObjectCreateOfType(MRFHuman);
    MRFArray *children = MRFObjectCreateOfType(MRFArray);
    
    MRFHumanSetChildren(newHuman, children);
    MRFHumanSetName(newHuman, name);
    MRFHumanSetGender(newHuman, gender);
    MRFHumanSetAge(newHuman, age);
    
    return newHuman;
}

MRFHuman *MRFHumanCreateChild(MRFHuman *mother, MRFHuman *father) {
    if (NULL != mother && NULL != father) {
        MRFHuman *newChild = MRFHumanCreateWithParameters("", MRFHumanRandomGender(), 0);
        
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
    if (NULL != object && NULL != partner) {
        if (object != partner && MRFHumanGetGender(object) != MRFHumanGetGender(partner)) {
            MRFHuman *male = (kMRFHumanMale == MRFHumanGetGender(object)
                              ? object
                              : partner);
            MRFHuman *female = (kMRFHumanFemale == MRFHumanGetGender(object)
                                 ? object
                                 : partner);
            
            MRFHumanSetPartner(male, female);
            MRFHumanSetPartner(female, male);
            
            MRFObjectRetain(female);
        }
    }
}

void MRFHumanDivorce(MRFHuman *object) {
    if (NULL != object && NULL != MRFHumanGetPartner(object)) {
        MRFHuman *male = (kMRFHumanMale == MRFHumanGetGender(object)
                          ? object
                          : MRFHumanGetPartner(object));
        MRFHuman *female = MRFHumanGetPartner(male);
        
        MRFHumanSetPartner(female, NULL);
        
        if (male != female) {
            MRFObjectRelease(female);
            MRFHumanSetPartner(male, NULL);
        }
    }
}

MRFHuman *MRFHumanGetPartner(MRFHuman *object) {
    return object->_partner;
}

MRFHuman *MRFHumanGetFather(MRFHuman *object) {
    return object->_father;
}

MRFHuman *MRFHumanGetMother(MRFHuman *object) {
    return object->_mother;
}

void MRFHumanAddChild(MRFHuman *mother, MRFHuman *father, MRFHuman *child) {
    if (NULL != mother && NULL != father && NULL != child) {
        MRFArrayAddObject(MRFHumanGetChildren(mother), child);
        MRFArrayAddObject(MRFHumanGetChildren(father), child);
        mother->_childrenCount += 1;
        father->_childrenCount += 1;
    }
}

MRFArray *MRFHumanGetChildren(MRFHuman *object) {
    return NULL != object ? object->_children : NULL;
}

MRFHuman *MRFHumanGetChildAtIndex(MRFHuman *object, uint8_t index) {
    return MRFArrayGetObjectAtIndex(MRFHumanGetChildren(object), index);
}

void MRFHumanSetName(MRFHuman *object, char *name) {
    if (NULL != object) {
        MRFString *previousName = object->_name;
        
        if (NULL != previousName) {
            MRFObjectRelease(previousName);
            object->_name = NULL;
        }
        
        if (NULL != name) {
            object->_name = MRFStringCreateWithString(name);
            
            assert(NULL != object->_name);
        }
    }
}

char *MRFHumanGetName(MRFHuman *object) {
    return MRFStringGetString(object->_name);
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

#pragma mark -
#pragma mark Private Implementations

void MRFHumanSetChildren(MRFHuman *object, MRFArray *children) {
    if (NULL != object) {
        MRFObjectRetain(children);
        MRFObjectRelease(object->_children);
        object->_children = children;
    }
}

void MRFHumanSetPartner(MRFHuman *object, MRFHuman *partner) {
    if (NULL != object) {
        object->_partner = partner;
    }
}

void MRFHumanSetFather(MRFHuman *object, MRFHuman *father) {
    if (NULL != object && NULL != father) {
        object->_father = father;
    }
}

void MRFHumanSetMother(MRFHuman *object, MRFHuman *mother) {
    if (NULL != object && NULL != mother) {
        object->_mother = mother;
    }
}

uint8_t MRFHumanRandomGender() {
    uint8_t randomGender = rand() % 3;
    
    return (randomGender == kMRFHumanUndefined) ? randomGender += 1 : randomGender;
}
