#include <stdio.h>
#include <stdlib.h>

#include "MRFHumanTests.h"
#include "MRFArrayTests.h"
#include "MRFStringTests.h"
#include "MRFLinkedListTests.h"
#include "MRFLinkedListNodeTests.h"
#include "MRFAutoReleasingStackTests.h"

int main(int argc, const char * argv[]) {
    MRFArrayTests();
    MRFHumanTests();
    MRFStringTests();
    MRFLinkedListTests();
    MRFLinkedListNodeTests();
    MRFAutoReleasingStackTests();
    
    return 0;
}
