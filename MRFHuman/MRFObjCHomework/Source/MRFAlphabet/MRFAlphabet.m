//
//  MRFAlphabet.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabet.h"
#import "MRFAlphabetWithRange.h"

@implementation MRFAlphabet

@dynamic symbols;

+ (MRFAlphabet *)alphabetWithUnicodeRange:(NSRange)range {
    return [[[MRFAlphabetWithRange alloc] initWithUnicodeRange:range] autorelease];
}


+ (instancetype)capitalizedLetterAlphabet {
    NSRange range = {'A', 26};
    return [self alphabetWithUnicodeRange:range];
}

+ (instancetype)lowercaseLetterAlphabet {
    NSRange range = {'a', 26};
    return [self alphabetWithUnicodeRange:range];
}

@end
