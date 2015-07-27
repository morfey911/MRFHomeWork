//
//  MRFAlphabetWithStrings.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 27.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetWithStrings.h"

@interface MRFAlphabetWithStrings ()
@property (nonatomic, retain) NSMutableArray *strings;

@end

@implementation MRFAlphabetWithStrings

- (instancetype)initWithStrings:(NSArray *)strings {
    self = [super init];
    
    if (self) {
        self.strings = [NSMutableArray arrayWithArray:strings];
    }
    
    return self;
}

- (NSArray *)symbols {
    return [[self.strings copy] autorelease];
}

@end
