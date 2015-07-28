//
//  MRFAlphabetWithRange.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabetWithRange.h"

@interface MRFAlphabetWithRange ()
@property (nonatomic, assign) NSRange range;

@end

@implementation MRFAlphabetWithRange

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)initWithUnicodeRange:(NSRange)range {
    self = [super init];
    
    if (self) {
        self.range = range;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)symbols {
    NSRange range = self.range;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:NSMaxRange(range)];
    
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        NSString *string = [NSString stringWithFormat:@"%C", character];
        [array addObject:string];
    }
    
    return [[array copy] autorelease];
}


- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)symbolAtIndex:(NSUInteger)index {
    return [NSString stringWithFormat:@"%C", (unichar)(self.range.location + index)];
}

@end
