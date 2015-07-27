//
//  MRFAlphabetWithStrings.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 27.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetWithStrings.h"

@interface MRFAlphabetWithStrings ()
@property (nonatomic, retain) NSMutableArray *mutableArray;

@end

@implementation MRFAlphabetWithStrings

- (instancetype)initWithStrings:(NSArray *)array {
    self = [super init];
    
    if (self) {
        self.mutableArray = [NSMutableArray arrayWithArray:array];
    }
    
    return self;
}

- (NSArray *)symbols {
    return [[self.mutableArray copy] autorelease];
}

@end
