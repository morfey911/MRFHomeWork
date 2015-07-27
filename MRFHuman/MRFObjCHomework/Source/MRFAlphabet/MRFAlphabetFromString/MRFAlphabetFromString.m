//
//  MRFAlphabetFromString.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 23.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetFromString.h"

@interface MRFAlphabetFromString ()
@property (nonatomic, retain) NSMutableString *mutableStringWithSymbols;

@end

@implementation MRFAlphabetFromString

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableStringWithSymbols = nil;
    
    [super dealloc];
}

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    
    if (self) {
        self.mutableStringWithSymbols = [NSMutableString stringWithString:string];
    }
    
    return self;
}

#pragma mark -
#pragma mark Overriden parent method

- (NSArray *)symbols {
    NSMutableArray *array = [NSMutableArray array];
    NSString *string = [[self.mutableStringWithSymbols copy] autorelease];
    NSUInteger length = [string length];
    
    for (NSUInteger iterator = 0; iterator < length; iterator++) {
        NSString* character = [NSString stringWithFormat:@"%C", [string characterAtIndex:iterator]];
        [array addObject:character];
    }
    
    return [[array copy] autorelease];
}

@end
