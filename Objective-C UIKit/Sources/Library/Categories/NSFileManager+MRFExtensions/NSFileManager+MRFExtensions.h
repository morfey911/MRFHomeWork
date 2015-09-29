//
//  NSFileManager+MRFExtensions.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MRFExtensions)

+ (NSString *)pathForUserDocument;

+ (NSString *)pathForUserDirectory:(NSSearchPathDirectory)directory;

+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
                    domainMask:(NSSearchPathDomainMask)domainMask;

+ (NSString *)pathForDirectoryWithTilde:(NSSearchPathDirectory)directory
                             domainMask:(NSSearchPathDomainMask)domainMask;

+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
                    domainMask:(NSSearchPathDomainMask)domainMask
                   expandTilde:(BOOL)expandTilde;

@end
