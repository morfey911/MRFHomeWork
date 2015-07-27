//
//  MRFAlphabetWithAlphabets.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 27.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetWithAlphabets.h"

@interface MRFAlphabetWithAlphabets ()
@property (nonatomic, retain) NSMutableArray *alphabets;

@end

@implementation MRFAlphabetWithAlphabets

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    
    if (self) {
        self.alphabets = [NSMutableArray arrayWithArray:alphabets];
    }
    
    return self;
}

#pragma mark -
#pragma mark Overriden parent getter

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray array];
    for (MRFAlphabet *alphabet in self.alphabets) {
        [result addObjectsFromArray:[alphabet symbols]];
    }
    
    return result;
}

@end
