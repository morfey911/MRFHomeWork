//
//  MRFEmployeeAccountant.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployee.h"

@interface MRFEmployeeAccountant : MRFEmployee
@property (nonatomic, assign, readonly) uint8_t capital;

- (instancetype)initWithCapital:(uint8_t)capital;

@end
