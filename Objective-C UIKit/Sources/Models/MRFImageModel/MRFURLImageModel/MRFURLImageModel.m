//
//  MRFURLImageModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFURLImageModel.h"

@interface MRFURLImageModel ()
@property (nonatomic, strong)   NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;

@end

@implementation MRFURLImageModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        [self configureSession];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setTask:(NSURLSessionDownloadTask *)task {
    if (_task != task) {
        [_task cancel];
        _task = task;
        [_task resume];
    }
}

#pragma mark -
#pragma mark MRFImageModel

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
    self.task = [self.session downloadTaskWithURL:self.url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
//        [super performLoadingWithCompletion:completion];
}

#pragma mark -
#pragma mark Private

- (void)configureSession {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:configuration];
}

@end
