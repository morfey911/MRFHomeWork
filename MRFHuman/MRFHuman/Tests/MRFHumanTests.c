//
//  MRFHumanTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 17.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "MRFHumanTests.h"
#include "MRFHuman.h"
#include "MRFObject.h"

void MRFHumanTests() {
    //after human was created
    MRFHuman *masha = MRFHumanCreateWithParameters("Masha", kMRFHumanFemale, 18);
    MRFHuman *vasya = MRFHumanCreateWithParameters("Vasya", kMRFHumanMale, 20);
    
    //retain count must be equal to 1
    assert(MRFObjectGetReferenceCount(masha) == 1);
    assert(MRFObjectGetReferenceCount(vasya) == 1);
    
    //after merried
    MRFHumanGetMarried(masha, vasya);

    //retain count for man must be equal 1 and 2 for woman.
    assert(MRFObjectGetReferenceCount(masha) == 2);
    assert(MRFObjectGetReferenceCount(vasya) == 1);
    
    //print description
    MRFHumanPrintDescription(masha);
    MRFHumanPrintDescription(vasya);
    
    //after child birth
    MRFHuman *bob = MRFHumanCreateChild(masha, vasya);
    
    //retain count must be equal to 3
    assert(MRFObjectGetReferenceCount(bob) == 3);
    
    //after divorce
    MRFHumanDivorce(masha);
    
    //retain count to both partners must be equal to 1
    assert(MRFObjectGetReferenceCount(masha) == 1);
    assert(MRFObjectGetReferenceCount(vasya) == 1);
    
    //print description
    MRFHumanPrintDescription(masha);
    MRFHumanPrintDescription(vasya);
    
    MRFObjectRelease(masha);
    MRFObjectRelease(vasya);
    MRFObjectRelease(bob);
    
}
