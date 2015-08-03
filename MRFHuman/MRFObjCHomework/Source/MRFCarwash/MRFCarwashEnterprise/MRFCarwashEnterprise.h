//
//  MRFCarwashEnterprise.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 15.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFCarwashEnterprise : NSObject
@property (nonatomic, copy, readonly) NSMutableSet *washers;

- (void)preparation;

- (void)work;

@end
