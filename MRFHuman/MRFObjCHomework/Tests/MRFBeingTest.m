//
//  MRFBeingTest.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 07.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBeingTest.h"
#import "MRFBeing.h"

@implementation MRFBeingTest

+ (void) testMRFBeing {
    MRFBeing *being1 = [[[MRFBeing alloc] initWithName:@"Being1" age:25 gender:kMRFBeingMaleGender] autorelease];
    
    NSAssert(nil != being1, @"Should not be nil");
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    
    for (int i = 0; i < 10; i++) {
        NSString *name = [NSString stringWithFormat:@"Being_%d", i];
        if (0 == i % 2) {
            MRFBeing *baby = [[[MRFBeing alloc] initWithName:name age:0 gender:kMRFBeingMaleGender] autorelease];
        } else {
            MRFBeing *baby = [[[MRFBeing alloc] initWithName:name age:0 gender:kMRFBeingFemaleGender] autorelease];
        }
        
    }
    
    
    
}

@end
