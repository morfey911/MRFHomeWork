//
//  MRFMaleBeing.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 09.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFMaleBeing.h"

@implementation MRFMaleBeing

- (void)fight {
    NSLog(@"%@ Going to fight!!!", self.name);
}

- (void)performGenderSpecificOperation {
    [self fight];
}

@end
