//
//  MRFCarwashEnterprise.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 15.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCarwashEnterprise.h"

#import "NSObject+MRFObjectExtensions.h"

#import "MRFEmployeeWasher.h"
#import "MRFCar.h"

@interface MRFCarwashEnterprise ()
@property (nonatomic, copy) NSMutableSet *mutableWashers;

@end

@implementation MRFCarwashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableWashers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableWashers = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)washers {
    return [[self.mutableWashers copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)preparation {
    
}

- (void)work {
    
}

@end
