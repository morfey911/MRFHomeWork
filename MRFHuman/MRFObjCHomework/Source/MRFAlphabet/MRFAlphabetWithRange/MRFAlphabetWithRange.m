//
//  MRFAlphabetWithRange.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetWithRange.h"

@interface MRFAlphabetWithRange ()
@property (nonatomic, retain) NSMutableString *mutableStringWithSymbols;

@end

@implementation MRFAlphabetWithRange

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableStringWithSymbols = nil;
    
    [super dealloc];
}

- (instancetype)initWithUnicodeRange:(NSRange)range {
    self = [super init];
    
    if (self) {
        self.mutableStringWithSymbols = [NSMutableString string];
        
        for (unichar character = range.location; character < NSMaxRange(range); character++ ) {
            [self.mutableStringWithSymbols appendFormat:@"%c", character];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)symbols {
    NSMutableArray *array = [NSMutableArray array];
    NSString *string = [[self.mutableStringWithSymbols copy] autorelease];
    NSUInteger length = [string length];
    
    for (NSUInteger iterator = 0; iterator < length; iterator++) {
        NSString* character = [NSString stringWithFormat:@"%c", [string characterAtIndex:iterator]];
        [array addObject:character];
    }
    
    return [[array copy] autorelease];
}

@end
