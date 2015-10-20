//
//  MRFURLImageModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFURLImageModel.h"

#import "NSFileManager+MRFExtensions.h"

@interface MRFURLImageModel ()
@property (nonatomic, strong)   NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;
@property (nonatomic, strong)   NSString                    *fileFolder;
@property (nonatomic, strong)   NSString                    *fileName;
@property (nonatomic, strong)   NSURL                       *savePath;

- (void)loadImageFromCache:(void (^)(UIImage *image, id error))completion;
- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion;

@end

@implementation MRFURLImageModel

@dynamic session;
@dynamic fileFolder;
@dynamic fileName;
@dynamic savePath;

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)session {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    return [NSURLSession sessionWithConfiguration:configuration];
}

- (void)setTask:(NSURLSessionDownloadTask *)task {
    if (_task != task) {
        [_task cancel];
        _task = task;
        [_task resume];
    }
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)fileName {
    return self.url.lastPathComponent;
}

- (NSURL *)savePath {
    NSString *path = [self.fileFolder stringByAppendingPathComponent:self.fileName];
    
    return [NSURL fileURLWithPath:path];
}

#pragma mark -
#pragma mark Public

- (void)cancel {
    self.task = nil;
    
    [self dump];
}

#pragma mark -
#pragma mark MRFImageModel

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
    [self loadImageFromCache:completion];
}

#pragma mark -
#pragma mark Private

- (void)loadImageFromCache:(void (^)(UIImage *image, id error))completion {
    NSURL *savePath = self.savePath;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExists = [fileManager fileExistsAtPath:savePath.relativePath];
    
    if (fileExists) {
        NSData *data = [NSData dataWithContentsOfURL:savePath];
        UIImage *image = [UIImage imageWithData:data];
        if (image) {
            completion(image, nil);
        } else {
            [fileManager removeItemAtURL:savePath error:nil];
            [self loadImageFromInternet:completion];
        }
    } else {
        [self loadImageFromInternet:completion];
    }
}

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion {
    self.task = [self.session downloadTaskWithURL:self.url
                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
                 {
                     if (!error) {
                         [[NSFileManager defaultManager] copyItemAtURL:location toURL:self.savePath error:nil];
                         [self loadImageFromCache:completion];
                     } else {
                         self.state = MRFModelDidFailLoading;
                     }
                 }];

}

@end
