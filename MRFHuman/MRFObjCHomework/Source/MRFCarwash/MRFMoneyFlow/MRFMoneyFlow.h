//
//  MRFMoneyFlow.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRFMoneyFlow <NSObject>

- (void)takeMoney:(uint64_t)money from:(id)moneyKeeper;

@optional
- (void)giveMoney:(uint64_t)money to:(id)moneyKeeper;

@end