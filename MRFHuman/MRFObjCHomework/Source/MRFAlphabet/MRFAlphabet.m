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

@implementation MRFAlphabet

@dynamic symbols;

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    return [[[MRFAlphabetWithRange alloc] initWithUnicodeRange:range] autorelease];
}

+ (instancetype)alphabetWithString:(NSString *)string {
    return [[[MRFAlphabetFromString alloc] initWithString:string] autorelease];
}

+ (instancetype)uppercaseLetterAlphabet {
    NSRange range = {'A', 26};
    return [self alphabetWithUnicodeRange:range];
}

+ (instancetype)lowercaseLetterAlphabet {
    NSRange range = {'a', 26};
    return [self alphabetWithUnicodeRange:range];
}

+ (instancetype)numericAlphabet {
    NSRange range = {'0', 10};
    return [self alphabetWithUnicodeRange:range];
}

@end
