//
//  MRFFileImageModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFileImageModel.h"

#import "NSFileManager+MRFExtensions.h"

#import "MRFDispatch.h"

@implementation MRFFileImageModel

@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self.url relativePath]];
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoadingWithCompletion:(void (^)(UIImage *, id))completion {
    UIImage *image = [UIImage imageWithContentsOfFile:[self.url relativePath]];
    
    completion(image, nil);
}

@end
