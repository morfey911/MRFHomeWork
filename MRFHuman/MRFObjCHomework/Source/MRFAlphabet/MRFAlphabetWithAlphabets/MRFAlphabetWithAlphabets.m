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

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    
    if (self) {
        self.alphabets = [NSMutableArray arrayWithArray:alphabets];
    }
    
    return self;
}

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray array];
    for (MRFAlphabet *alphabet in self.alphabets) {
        [result addObjectsFromArray:[alphabet symbols]];
    }
    
    return result;
}

@end
