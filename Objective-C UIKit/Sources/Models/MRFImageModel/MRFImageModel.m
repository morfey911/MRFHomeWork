//
//  MRFImageModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 12.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFImageModel.h"

#import "MRFCache.h"

#import "MRFFileImageModel.h"
#import "MRFURLImageModel.h"

#import "NSURL+MRFExtensions.h"

#import "MRFDispatch.h"
#import "MRFMacros.h"

@interface MRFImageModel ()
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   MRFCache    *imageCache;

@end

@implementation MRFImageModel

@dynamic imageCache;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    return [NSURL imageModelForURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    MRFCache *imageCache = self.imageCache;
    id imageModel = [imageCache objectForKey:url];
    
    if (imageModel) {
        return imageModel;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
        [imageCache addObject:self forKey:url];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (MRFCache *)imageCache {
    return [MRFCache cache];
}

#pragma mark -
#pragma mark Public

- (void)save {
    
}

- (void)dump {
    self.image = nil;
    self.state = MRFModelNotLoaded;
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {
    
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
    MRFWeakify(self);
    MRFDispatchAsyncOnMainThread(^{
        MRFStrongifyAndReturnIfNil(self);
        
        self.state = self.image ? MRFModelDidLoad : MRFModelDidFailLoading;
    });
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    MRFWeakify(self);
    [self performLoadingWithCompletion:^(UIImage *image, id error) {
        MRFStrongifyAndReturnIfNil(self);
        
        [self finalizeLoadingWithImage:image error:error];
        [self notifyOfLoadingStateWithImage:image error:error];
    }];
}

@end
