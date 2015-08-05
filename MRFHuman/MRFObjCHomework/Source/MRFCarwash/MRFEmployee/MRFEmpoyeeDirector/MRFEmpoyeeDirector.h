//
//  MRFEmpoyeeDirector.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployee.h"

@interface MRFEmpoyeeDirector : MRFEmployee
@property (nonatomic, assign, readonly)   uint64_t capital;

- (instancetype)initWithCapital:(uint64_t)capital;

@end
