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

@interface MRFImageModel ()
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, strong)   UIImage         *image;
@property (nonatomic, strong)   MRFImageCache   *imageCache;

@end

@implementation MRFImageModel

@dynamic imageCache;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    MRFImageCache *imageCache = self.imageCache;
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

- (MRFImageCache *)imageCache {
    return [MRFImageCache imageCache];
}

#pragma mark -
#pragma mark Public

- (void)addImage:(UIImage *)image {
    self.image = image;
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
}

@end
