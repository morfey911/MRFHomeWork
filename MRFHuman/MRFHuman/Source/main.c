#include <stdio.h>
#include <stdlib.h>

#include "MRFHuman.h"

int main(int argc, const char * argv[]) {
//    MRFHuman *vasya = malloc(sizeof(MRFHuman));
//    
//    MRFHumanSet_name(vasya, "Vasya");
//    MRFHumanSet_gender(vasya, 3);
//    
//    printf("%s\n", vasya->_name);
//    printf("%d\n", vasya->_sex);
    
    MRFHuman *masha = MRFHumanCreate("Masha", female, 18);
    MRFHuman *vasya = MRFHumanCreate("Vasya", male, 20);
    
    MRFHumanGetMarried(masha, vasya);
    
    MRFHumanPrint(masha);
    MRFHumanPrint(vasya);
    
    MRFHumanDivorce(masha);
    
    MRFHumanPrint(masha);
    MRFHumanPrint(vasya);

    return 0;
}
