//
//  NSFileManager+MRFExtensions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSFileManager+MRFExtensions.h"

@implementation NSFileManager (MRFExtensions)

+ (NSString *)pathForUserDocument {
    return [self pathForUserDirectory:NSDocumentDirectory];
}

+ (NSString *)pathForUserDirectory:(NSSearchPathDirectory)directory {
    return [self pathForDirectoryWithTilde:directory domainMask:NSUserDomainMask];
}

+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
                    domainMask:(NSSearchPathDomainMask)domainMask
{
    return [self pathForDirectory:directory domainMask:domainMask expandTilde:NO];
}

+ (NSString *)pathForDirectoryWithTilde:(NSSearchPathDirectory)directory
                             domainMask:(NSSearchPathDomainMask)domainMask
{
    return [self pathForDirectory:directory domainMask:domainMask expandTilde:YES];
}

+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
                    domainMask:(NSSearchPathDomainMask)domainMask
                   expandTilde:(BOOL)expandTilde
{
    return [NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde) firstObject];
}

@end
