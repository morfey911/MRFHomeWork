//
//  MRFCarwashRoom.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFRoom.h"
#import "MRFCar.h"

@interface MRFCarwashRoom : MRFRoom
@property (nonatomic, retain, readonly) NSSet   *cars;
@property (nonatomic, assign, readonly) uint8_t carCapacity;

- (instancetype)initWithHumanCapacity:(uint8_t)humanCapacity carCapacity:(uint8_t)carCapacity;

- (void)addCar:(MRFCar *)car;
- (void)removeCat:(MRFCar *)car;

@end
