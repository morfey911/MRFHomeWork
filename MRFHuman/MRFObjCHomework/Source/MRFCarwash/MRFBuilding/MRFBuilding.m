//
//  MRFBuilding.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBuilding.h"

@interface MRFBuilding ()
@property (nonatomic, retain) NSMutableSet *mutableRooms;
@property (nonatomic, assign) uint8_t roomCapacity;

@end

@implementation MRFBuilding

@dynamic rooms;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithRoomCapacity:0];
}

- (instancetype)initWithRoomCapacity:(uint8_t)roomCapacity {
    self = [super init];
    
    if (self) {
        self.mutableRooms = [NSMutableSet setWithCapacity:roomCapacity];
        self.roomCapacity = roomCapacity;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addRoom:(MRFRoom *)room {
    if (self.roomCapacity < [self.mutableRooms count]) {
        [self.mutableRooms addObject:room];
    }
}

- (void)removeRoom:(MRFRoom *)room {
    [self.mutableRooms removeObject:room];
}

@end
