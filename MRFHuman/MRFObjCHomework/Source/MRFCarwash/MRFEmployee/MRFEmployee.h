//
//  MRFEmployee.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFEmployee : NSObject
@property (nonatomic, assign) uint8_t money;
@property (nonatomic, assign) uint8_t salary;
@property (nonatomic, assign) uint8_t experience;

- (void)takeMoney:(uint8_t)money from:(id)object;
- (void)giveMoney:(uint8_t)money to:(id)object;


@end
