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

@end

@implementation MRFFileImageModel

@dynamic filePath;
@dynamic fileName;
@dynamic fileFolder;
@dynamic fileCached;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    return [super initWithURL:url];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (NSString *)fileName {
    return self.url.lastPathComponent;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (BOOL)isFileCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public

- (void)dump {
    if (self.isFileCached) {
        [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:nil];
    }
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    if (!self.isFileCached) {
        [[NSFileManager defaultManager] copyItemAtURL:self.url toURL:[NSURL fileURLWithPath:self.filePath] error:nil];
    } else if (self.isFileCached) {
        UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
        
        if (image) {
            [self addImage:image];
        } else {
            [self dump];
            
            MRFDispatchAsyncOnMainThread(^{
                self.state = MRFModelDidFailLoading;
            });
        }
    }
}

@end
