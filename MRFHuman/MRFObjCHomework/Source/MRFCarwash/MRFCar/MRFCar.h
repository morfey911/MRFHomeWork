//
//  MRFCar.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRFMoneyKeeper.h"

@interface MRFCar : MRFMoneyKeeper
@property (nonatomic, assign)           BOOL        isClear;

- (instancetype)initWithMoney:(uint8_t)money;

@end
