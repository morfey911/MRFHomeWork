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
    [NSStringExtensions NSStringExtensionsRandomStringTest];
    
    NSLog(@"<<<end NSStringPerfomExtensionsTests>>>\n\n");
}

+ (void)NSStringExtensionsTest {
    //after string was created with +alphabetWithUnicodeRange with range
    NSRange range = {'A', 26};
    MRFAlphabet *alphabet = [MRFAlphabet alphabetWithUnicodeRange:range];
    NSString *string = [NSString stringWithAlphabet:alphabet];
    
    //string must be equal to NSString class
    NSAssert([string isKindOfClass:[NSString class]], @"1");
    
    //string length must be 26
    NSAssert(26 == [string length], @"2");
    
    //string should be equals to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    NSAssert([string isEqualToString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"] , @"3");
    
    NSLog(@"%@", string);

}

+ (void)NSStringExtensionsRandomStringTest {
    NSRange cyrillicRange = {0x0410, 0x044F-0x0410};
    MRFAlphabet *cyrillicTable = [MRFAlphabet alphabetWithUnicodeRange:cyrillicRange];
    NSString *randomString = [NSString randomStringWithLength:200 alphabet:cyrillicTable];
    NSLog(@"%@", randomString);
}


@end
