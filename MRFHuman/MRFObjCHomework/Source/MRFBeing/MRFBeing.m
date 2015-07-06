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


- (id) initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        self.name = name;
    }
    
    return self;
}

- (id) initWithName:(NSString *)name age:(uint8_t)age {
    self = [[MRFBeing alloc] initWithName:name];
    
    self.age = age;
    
    return self;
}

- (id) initWithName:(NSString *)name age:(uint8_t)age gender:(MRFBeingGender)gender {
    self = [[MRFBeing alloc] initWithName:name age:age];
    
    self.gender = gender;
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void) fight {
    if (self.gender) {
        NSLog(@"Fight");
    }
}

- (void) sayHi {
    NSLog(@"Hi");
}

@end
