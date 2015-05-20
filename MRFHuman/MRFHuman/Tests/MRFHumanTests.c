//
//  MRFHumanTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 17.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdio.h>

#include "MRFHumanTests.h"
#include "MRFHuman.h"
#include "MRFObject.h"

void MRFHumanTests() {
    MRFHuman *masha = MRFHumanCreateWithParameters("Masha", kMRFHumanFemale, 18);
    MRFHuman *vasya = MRFHumanCreateWithParameters("Vasya", kMRFHumanMale, 20);
    
    MRFHumanGetMarried(masha, vasya);
    
    MRFHumanPrintDescription(masha);
    MRFHumanPrintDescription(vasya);
    
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    
    printf("Children created: %d\n", MRFHumanGetChildrenCount(vasya));
    printf("%d\n", MRFHumanGetGender(MRFHumanGetChildAtIndex(masha, 0)));
    
    MRFHumanDivorce(masha);
    
    MRFHumanPrintDescription(masha);
    MRFHumanPrintDescription(vasya);
}
