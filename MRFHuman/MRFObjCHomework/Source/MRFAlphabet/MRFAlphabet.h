//
//  MRFAlphabet.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

/*
 symbols  сделать методом
 count, objectAtIndex - реализовать методы
 объявить в хедере кластерногго класса init сам классов
 реализовать NSFastEnumeration
*/

#import <Foundation/Foundation.h>

@interface MRFAlphabet : NSObject <NSFastEnumeration>
@property (nonatomic, copy, readonly) NSArray *symbols;

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;
+ (instancetype)alphabetWithString:(NSString *)string;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;

- (instancetype)initWithUnicodeRange:(NSRange)range;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;

+ (instancetype)uppercaseLetterAlphabet;

+ (instancetype)lowercaseLetterAlphabet;

+ (instancetype)letterAlphabet;

+ (instancetype)numericAlphabet;

@end
