//
//  NSString+MRFNStringExtensions.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFAlphabet.h"
#import "MRFAlphabets.h"

@interface NSString (MRFNStringExtensions)

+ (instancetype)makeStringFromAlphabet:(MRFAlphabet *)alphabet;


+ (instancetype)randomStringWithLength:(uint32_t)length alphabet:(MRFAlphabet *)alphabet;

+ (instancetype)randomStringWithLength:(uint32_t)length;

+ (instancetype)randomString;

@end
