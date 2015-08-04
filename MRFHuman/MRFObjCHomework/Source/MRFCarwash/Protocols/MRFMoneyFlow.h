//
//  MRFMoneyFlow.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRFMoneyFlow <NSObject>
@property (nonatomic, assign)uint8_t money;

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id)moneyKeeper;

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id)moneyKeeper;

@end
