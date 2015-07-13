//
//  NSObject+MRFObjectExtensions.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSObject+MRFObjectExtensions.h"

@implementation NSObject (MRFObjectExtensions)

+ (id)object {
    return [[[self alloc] init] autorelease];
}

@end
