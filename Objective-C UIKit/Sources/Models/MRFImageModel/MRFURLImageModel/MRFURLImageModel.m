//
//  MRFURLImageModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFURLImageModel.h"

#import "NSFileManager+MRFExtensions.h"

#import "MRFMacros.h"

@interface MRFURLImageModel ()
@property (nonatomic, strong)   NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion;

@end

@implementation MRFURLImageModel

@dynamic fileFolder;
@dynamic fileName;
@dynamic session;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self dump];
}

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)session {
    static NSURLSession *__session = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        __session = [NSURLSession sessionWithConfiguration:configuration];
    });
    
    return __session;
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

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

#pragma mark -
#pragma mark Public

- (void)dump {
    [super dump];
    
    self.task = nil;
}

#pragma mark -
#pragma mark MRFImageModel

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
    if (self.cached) {
        [super performLoadingWithCompletion:completion];
    } else {
        [self loadImageFromInternet:completion];
    }
}

#pragma mark -
#pragma mark Private

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion {
    MRFWeakify(self);
    id block = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        MRFStrongifyAndReturnIfNil(self);
        if (!error) {
            NSURL *fileURL = [NSURL fileURLWithPath:self.filePath];
            
            [[NSFileManager defaultManager] copyItemAtURL:location toURL:fileURL error:nil];
            [super performLoadingWithCompletion:completion];
        }
    };
    
    self.task = [self.session downloadTaskWithURL:self.url completionHandler:block];
}

@end
