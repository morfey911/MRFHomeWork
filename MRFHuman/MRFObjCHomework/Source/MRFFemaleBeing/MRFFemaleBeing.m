//
//  MRFFemaleBeing.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFemaleBeing.h"

@implementation MRFFemaleBeing

- (void)giveBirth {
    MRFBeingGender randomGender = (arc4random() % 2) + 1;
    
    NSLog(@"%@ Going to create a new child", super.description);
    
    self.lastBornChild = [[[self class] alloc] initWithGender:randomGender];
}

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

@end
