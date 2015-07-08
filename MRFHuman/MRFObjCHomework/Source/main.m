//
//  main.m
//  MRFObjCHomework
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFBeing.h"
#import "MRFBeingTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MRFBeing *being1 = [[[MRFBeing alloc] initWithGender:kMRFBeingMaleGender] autorelease];
        MRFBeing *being2 = [[[MRFBeing alloc] initWithGender:kMRFBeingFemaleGender] autorelease];
        
        being1.name = @"Being1";
        being2.name = @"ololo";
        
        for (int i = 0; i < 10; i++) {
            MRFBeing *newBaby = [being2 giveBirth];
            
            [being1 addChild:newBaby];
            [being2 addChild:newBaby];
        }
        
        NSLog(@"%@", being1);
        NSLog(@"%@", being2);
        
//        [MRFBeingTest testMRFBeing];
    }
    return 0;
}
