//
//  MRFAlphabet.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

/*
 TODO:
 реализовать NSFastEnumeration
 больше тестов для бога тестов!
*/

#import <Foundation/Foundation.h>

@interface MRFAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;
+ (instancetype)alphabetWithString:(NSString *)string;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;

- (instancetype)initWithUnicodeRange:(NSRange)range;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;

- (NSArray *)symbols;
- (NSUInteger)count;
- (NSString *)symbolAtIndex:(NSUInteger)index;

@end
