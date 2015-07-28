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

@end
