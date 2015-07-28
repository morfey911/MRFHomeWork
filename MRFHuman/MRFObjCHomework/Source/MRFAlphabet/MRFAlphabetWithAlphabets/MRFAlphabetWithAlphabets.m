//
//  MRFAlphabetWithAlphabets.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 27.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetWithAlphabets.h"

@interface MRFAlphabetWithAlphabets ()
@property (nonatomic, retain) NSMutableArray *alphabetsSymbols;

@end

@implementation MRFAlphabetWithAlphabets

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.alphabetsSymbols = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    
    if (self) {
        self.alphabetsSymbols = [NSMutableArray array];
        
        for (MRFAlphabet *alphabet in alphabets) {
            for (NSUInteger i = 0; i < [alphabet count]; i++) {
                [self.alphabetsSymbols addObject:[alphabet symbolAtIndex:i]];
            }
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Overriden parent getters

- (NSArray *)symbols {
    return [[self.alphabetsSymbols copy] autorelease];
}

- (NSUInteger)count {
    return [self.alphabetsSymbols count];
}

- (NSString *)symbolAtIndex:(NSUInteger)index {
    return [self.alphabetsSymbols objectAtIndex:index];
}

@end
