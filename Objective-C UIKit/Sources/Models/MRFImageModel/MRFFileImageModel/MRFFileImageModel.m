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

@interface MRFFileImageModel ()

- (void)deleteFromCacheIfNeeded;

@end

@implementation MRFFileImageModel

@dynamic fileFolder;
@dynamic fileName;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)fileName {
    return self.url.lastPathComponent;
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

#pragma mark -
#pragma mark MRFImageModel

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
    NSString *path = self.cached ? self.filePath : self.url.path;
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    if (!image) {
        [self deleteFromCacheIfNeeded];
    }
    
    completion(image, nil);
}

#pragma mark -
#pragma mark Private

- (void)deleteFromCacheIfNeeded {
    if (self.cached) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        
        [fileManager removeItemAtPath:self.filePath error:&error];
    }
}

@end
