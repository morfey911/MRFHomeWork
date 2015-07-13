//
//  MRFRoom.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFRoom.h"

@interface MRFRoom ()
@property (nonatomic, retain) NSMutableSet *mutableHumans;
@end

@implementation MRFRoom
@dynamic humans;

#pragma mark -
#pragma mark Initilizations and Deallocations

- (void)dealloc {
    self.mutableHumans = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithCapacity:0];
}

- (instancetype)initWithCapacity:(uint8_t)capacity {
    self = [super init];
    
    if (self) {
        self.humanCapacity = capacity;
        self.mutableHumans = [NSMutableSet setWithCapacity:capacity];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)humans {
    return [[self.mutableHumans copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addHuman:(id)human {
    [self.mutableHumans addObject:human];
}

- (void)removeHuman:(id)human {
    [self.mutableHumans removeObject:human];
}

@end
