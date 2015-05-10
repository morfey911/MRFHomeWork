//
//  Task3Structs.h
//  MRFHomeWork
//
//  Created by Yurii Mamurko on 10.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef MRFHomeWork_Task3Structs_h
#define MRFHomeWork_Task3Structs_h

#include <stdbool.h>

struct unsortedStruct{
    bool someBool2;
    bool someBool3;
    bool someBool6;
    float someFloat;
    int someInt;
    long long someLL;
    bool someBool5;
    short someShort1;
    bool someBool1;
    short someShort2;
    short someShort3;
    bool someBool4;
    double someDouble;
    char *someString;
};

struct sortedStruct{
    bool someBool1;
    bool someBool2;
    bool someBool3;
    bool someBool4;
    bool someBool5;
    bool someBool6;
    short someShort1;
    short someShort2;
    short someShort3;
    float someFloat;
    int someInt;
    double someDouble;
    long long someLL;
    char *someString;
};

struct sortedStructWithUnion {
    union {
        bool someBool1 : 2;
        bool someBool2 : 2;
        bool someBool3 : 2;
        bool someBool4 : 2;
        bool someBool5 : 2;
        bool someBool6 : 2;
    };
    short someShort1;
    short someShort2;
    short someShort3;
    float someFloat;
    int someInt;
    double someDouble;
    long long someLL;
    char *someString;
};

#endif
