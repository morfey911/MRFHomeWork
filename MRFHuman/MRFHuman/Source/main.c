#include <stdio.h>
#include <stdlib.h>

#include "MRFHuman.h"

int main(int argc, const char * argv[]) {
    MRFHuman *masha = MRFHumanCreate("Masha", female, 18);
    MRFHuman *vasya = MRFHumanCreate("Vasya", male, 20);
    
    MRFHumanGetMarried(masha, vasya);
    
    MRFHumanPrint(masha);
    MRFHumanPrint(vasya);
    
    MRFHumanCreateChildren(masha, vasya);
    MRFHumanCreateChildren(masha, vasya);
    
    printf("%d\n", MRFHumanGetChildrenCount(vasya));
    
    MRFHumanDivorce(masha);
    
    MRFHumanPrint(masha);
    MRFHumanPrint(vasya);

    return 0;
}
