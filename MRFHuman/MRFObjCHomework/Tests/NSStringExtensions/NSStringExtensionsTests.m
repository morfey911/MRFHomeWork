//
//  NSStringExtensions.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSStringExtensionsTests.h"

@implementation NSStringExtensions

+ (void)NSStringPerfomExtensionsTests {
    NSLog(@"<<<begin NSStringPerfomExtensionsTests>>>\n\n");
    
    [NSStringExtensions NSStringExtensionsTest];
    
    NSLog(@"<<<end NSStringPerfomExtensionsTests>>>\n\n");
}

+ (void)NSStringExtensionsTest {
    //after string was created with +alphabetWithUnicodeRange with range
    NSRange range = {'A', 26};
    NSString *string = [NSString alhabetWithUnicodeRange:range];
    
    //string must be equal to NSString class
    NSAssert([string isKindOfClass:[NSString class]], @"1");
    
    //string length must be 26
    NSAssert(26 == [string length], @"2");
    
    //string should be equals to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    NSAssert([string isEqualToString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"] , @"3");
    
    NSLog(@"%@", string);
}


@end
