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

typedef struct {
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
} unsortedStruct;

typedef struct {
    char *someString;
    long long someLL;
    double someDouble;
    int someInt;
    float someFloat;
    short someShort1;
    short someShort2;
    short someShort3;
    bool someBool1;
    bool someBool2;
    bool someBool3;
    bool someBool4;
    bool someBool5;
    bool someBool6;
} sortedStruct;

typedef struct {
    union {
        struct {
            bool someBool1 : 1;
            bool someBool2 : 1;
            bool someBool3 : 1;
            bool someBool4 : 1;
            bool someBool5 : 1;
            bool someBool6 : 1;
        } bitfield;
        char someCharValue;
    };
    short someShort1;
    short someShort2;
    short someShort3;
    float someFloat;
    int someInt;
    double someDouble;
    long long someLL;
    char *someString;
} sortedStructWithUnion;

#endif
