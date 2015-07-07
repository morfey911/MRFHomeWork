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

- (void) dealloc {
    self.name = nil;
    self.children = nil;
    
    [super dealloc];
}

- (id) initWithName:(NSString *)name age:(uint8_t)age gender:(MRFBeingGender)gender {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.age = age;
        self.gender = gender;
    }
    
    return self;
}

- (id) initWithName:(NSString *)name age:(uint8_t)age {
    self = [self initWithName:name age:age gender:0];
    
    return self;
}

- (id) initWithName:(NSString *)name {
    self = [self initWithName: name age:0 gender:0];
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void) fight {
    if (MRFBeingMaleGender == self.gender) {
        NSLog(@"Fight");
    }
}

- (void) giveBirth {
    if (MRFBeingFemaleGender == self.gender) {
        NSLog(@"Give birth");
    }
}

- (void) sayHi {
    NSLog(@"Hi");
}

@end
