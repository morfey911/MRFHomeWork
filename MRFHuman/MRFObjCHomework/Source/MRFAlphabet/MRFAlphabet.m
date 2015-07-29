//
//  MRFAlphabet.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabet.h"
#import "MRFAlphabetWithRange.h"
#import "MRFAlphabetFromString.h"
#import "MRFAlphabetWithStrings.h"

@implementation MRFAlphabet

#pragma mark -
#pragma mark Class methods

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    return [[[self alloc] initWithUnicodeRange:range] autorelease];
}

+ (instancetype)alphabetWithString:(NSString *)string {
    return [[[self alloc] initWithString:string] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[self alloc] initWithStrings:strings] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[self alloc] initWithAlphabets:alphabets] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUnicodeRange:(NSRange)range {
    [self release];
    
    return [[MRFAlphabetWithRange alloc] initWithUnicodeRange:range];
}

- (instancetype)initWithString:(NSString *)string {
    [self release];
    
    return [[MRFAlphabetFromString alloc] initWithString:string];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[MRFAlphabetWithStrings alloc] initWithStrings:strings];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[MRFAlphabetWithStrings alloc] initWithAlphabets:alphabets];
}


#pragma mark -
#pragma mark Public Methods

- (NSArray *)symbols {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)symbolAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self.symbols objectAtIndex:idx];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])buffer
                                    count:(NSUInteger)len
{
    if (0 == state->state) {
        state->mutationsPtr = (unsigned long *)self;
    }
    
    state->itemsPtr = buffer;
    NSUInteger count = 0;
    unsigned long passedCount = state->state;
    
    while (count < len && passedCount < [self.symbols count]) {
        buffer[count] = self[passedCount];
        count++;
        passedCount++;
    }
    
    state->state = passedCount;
    
    return count;
}

@end
