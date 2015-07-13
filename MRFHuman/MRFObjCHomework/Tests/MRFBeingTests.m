//
//  MRFBeingTests.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBeingTests.h"

@implementation MRFBeingTests

#pragma mark -
#pragma mark Public

+ (void)MRFBeingBehaviourTest {
    MRFBeing *being = [[[MRFBeing alloc] init] autorelease];
    MRFMaleBeing *maleBeing = [[[MRFMaleBeing alloc] initWithGender:kMRFBeingMaleGender] autorelease];
    MRFFemaleBeing *femaleBeing = [[[MRFFemaleBeing alloc] init] autorelease];
    
    
    NSLog(@"%@", being.description);
    NSLog(@"%@", maleBeing.description);
    NSLog(@"%@", femaleBeing.description);
    
    
//////////////////      TASK 1      //////////////////
//////////////////////////////////////////////////////
//    MRFBeing *maleBeing = [[[MRFBeing alloc] initWithGender:kMRFBeingMaleGender] autorelease];
//    MRFBeing *femaleBeing = [[[MRFBeing alloc] initWithGender:kMRFBeingFemaleGender] autorelease];
//    
//    maleBeing.name = @"Being1";
//    femaleBeing.name = @"ololo";
//    
//    for (NSUInteger i = 0; i < 10; i++) {
//        MRFBeing *newBaby = [femaleBeing giveBirth];
//        newBaby.name = [NSString stringWithFormat:@"child%ld", i];
//        
//        [maleBeing addChild:newBaby];
//        [femaleBeing addChild:newBaby];
//    }
//    
//    NSLog(@"\n%@ %@", maleBeing, maleBeing.children);
//    NSLog(@"\n%@ %@", femaleBeing, femaleBeing.children);
//    
//    [maleBeing sayHi];
//    [femaleBeing sayHi];
//    
//    for (MRFBeing *being in maleBeing.children) {
//        if (kMRFBeingMaleGender == being.gender) {
//            [being fight];
//        }
//        if (kMRFBeingFemaleGender == being.gender) {
//            [being giveBirth];
//        }
//    }
}

@end
