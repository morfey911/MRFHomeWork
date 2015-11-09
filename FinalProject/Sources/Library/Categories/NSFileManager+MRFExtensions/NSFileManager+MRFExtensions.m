//
//  NSFileManager+MRFExtensions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSFileManager+MRFExtensions.h"

@implementation NSFileManager (MRFExtensions)

+ (NSString *)userDocumentsPath {
    return [self pathWithSearchPathDirectory:NSDocumentDirectory];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)directory {
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) firstObject];
}

@end
