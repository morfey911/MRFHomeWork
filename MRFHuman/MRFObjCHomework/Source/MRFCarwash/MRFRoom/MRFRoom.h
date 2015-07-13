//
//  MRFRoom.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFRoom : NSObject
@property (nonatomic, retain, readonly) NSSet    *humans;
@property (nonatomic, assign)           uint8_t  humanCapacity;

- (instancetype)initWithHumanCapacity:(uint8_t)HumanCapacity;

- (void)addHuman:(id)human;
- (void)removeHuman:(id)human;

@end
