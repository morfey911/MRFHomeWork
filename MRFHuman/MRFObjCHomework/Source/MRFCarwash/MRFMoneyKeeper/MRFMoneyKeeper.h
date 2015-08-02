//
//  MRFMoneyKeeper.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 02.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFMoneyKeeper : NSObject

@property (nonatomic, assign)   uint32_t    money;

- (instancetype)initWithMoney:(uint32_t)money;

- (void)takeMoney:(uint32_t)money fromMoneyKeeper:(MRFMoneyKeeper *)moneyKeeper;

- (void)giveMoney:(uint32_t)money toMoneyKeeper:(MRFMoneyKeeper *)moneyKeeper;

@end
