#include <stdio.h>
#include <stdlib.h>

#include "MRFHumanTests.h"
#include "MRFArrayTests.h"
#include "MRFStringTests.h"

int main(int argc, const char * argv[]) {
    MRFArrayTests();
    MRFHumanTests();
    MRFStringTests();
    
    return 0;
}
