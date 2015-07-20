//
//  NSString+MRFNStringExtensions.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MRFNStringExtensions)

+ (instancetype)alhabetWithUnicodeRange:(NSRange)range;

+ (instancetype)randomStringWithLength:(uint32_t)length charString:(NSString *)string;

@end
