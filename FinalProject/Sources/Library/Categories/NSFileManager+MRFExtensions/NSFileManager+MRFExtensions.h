//
//  NSFileManager+MRFExtensions.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MRFExtensions)

+ (NSString *)userDocumentsPath;

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)directory;

@end
