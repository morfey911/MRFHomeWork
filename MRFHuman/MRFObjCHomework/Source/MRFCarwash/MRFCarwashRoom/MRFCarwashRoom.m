//
//  MRFCarwashRoom.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCarwashRoom.h"

@interface MRFCarwashRoom ()
@property (nonatomic, retain) NSMutableSet *mutableCars;
@property (nonatomic, assign) uint8_t carCapacity;
@end

@implementation MRFCarwashRoom

@dynamic cars;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithHumanCapacity:0 carCapacity:0];
}

- (instancetype)initWithHumanCapacity:(uint8_t)humanCapacity carCapacity:(uint8_t)carCapacity {
    self = [super initWithHumanCapacity:humanCapacity];
    
    if (self) {
        self.mutableCars = [NSMutableSet setWithCapacity:carCapacity];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(MRFCar *)car {
    if ([self.mutableCars count] < self.carCapacity) {
        [self.mutableCars addObject:car];
    }
}

- (void)removeCat:(MRFCar *)car {
    [self.mutableCars removeObject:car];
}

@end
