//
//  MRFCar.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFCar : NSObject
@property (nonatomic, assign) BOOL isClear;
@property (nonatomic, assign, readonly) uint8_t money;

- (instancetype)initWithMoney:(uint8_t)money andClear:(BOOL)isClear;

- (uint8_t)giveMoney:(uint8_t)money;

@end
