//
//  MRFAlphabet.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFAlphabet : NSObject
@property (nonatomic, copy, readonly) NSArray *symbols;

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;
+ (instancetype)alphabetWithString:(NSString *)string;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;


+ (instancetype)uppercaseLetterAlphabet;

+ (instancetype)lowercaseLetterAlphabet;

+ (instancetype)letterAlphabet;

+ (instancetype)numericAlphabet;

//TODO method to add alphabets to existing alphabetObject

@end
