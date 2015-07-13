//
//  MRFBuilding.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFRoom.h"

@interface MRFBuilding : NSObject
@property (nonatomic, retain, readonly) NSSet *rooms;
@property (nonatomic, assign, readonly) uint8_t roomCapacity;

- (instancetype)initWithRoomCapacity:(uint8_t)roomCapacity;

- (void)addRoom:(MRFRoom *)room;
- (void)removeRoom:(MRFRoom *)room;

@end
