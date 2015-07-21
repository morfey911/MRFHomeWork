//
//  NSString+MRFNStringExtensions.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MRFNStringExtensions)

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;

+ (instancetype)capitalizedLetterAlphabet;

+ (instancetype)lowercaseLetterAlphabet;

+ (instancetype)letterAlphabet;

+ (instancetype)randomStringWithLength:(uint32_t)length charString:(NSString *)string;

+ (instancetype)randomStringWithLength:(uint32_t)length;

+ (instancetype)randomString;

@end
