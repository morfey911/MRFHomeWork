//
//  MRFBeing.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 06.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBeing.h"

@implementation MRFBeing

#pragma mark -
#pragma mark Initializations and Deallocations

- (id) initWithName:(NSString *)name age:(uint8_t)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void) sayHi {
    NSLog(@"Hi");
}

@end
