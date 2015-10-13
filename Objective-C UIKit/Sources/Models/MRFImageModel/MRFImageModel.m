//
//  MRFImageModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 12.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFImageModel.h"

#import "MRFImageCache.h"

#import "MRFDispatch.h"

#import "NSFileManager+MRFExtensions.h"

@interface MRFImageModel ()
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, strong)   UIImage         *image;
@property (nonatomic, strong)   MRFImageCache   *imageCache;

@end

@implementation MRFImageModel

@dynamic filePath;
@dynamic fileName;
@dynamic fileFolder;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
        self.imageCache = [MRFImageCache imageCache];
    }
    
    return self;
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

- (BOOL)isCached {
    return [self.imageCache objectForKey:self.url];
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    id block = nil;
    
    if (self.cached) {
        block = ^{
            self.image = [UIImage imageWithContentsOfFile:self.filePath];
        };
    } else {
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    }
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
}

@end
