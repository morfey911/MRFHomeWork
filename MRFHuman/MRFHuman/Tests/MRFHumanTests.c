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

void MRFHumanTests() {
    MRFHuman *masha = MRFHumanCreate("Masha", kMRFHumanFemale, 18);
    MRFHuman *vasya = MRFHumanCreate("Vasya", kMRFHumanMale, 20);
    
    MRFHumanGetMarried(masha, vasya);
    
    MRFHumanPrint(masha);
    MRFHumanPrint(vasya);
    
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    
    printf("Children created: %d\n", MRFHumanGetChildrenCount(vasya));
    printf("%d\n", MRFHumanGetGender(MRFHumanGetChildrenAtIndex(masha, 0)));
    
    MRFHumanDivorce(masha);
    
    MRFHumanPrint(masha);
    MRFHumanPrint(vasya);
}