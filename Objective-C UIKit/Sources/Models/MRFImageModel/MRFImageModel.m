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

#import "MRFDispatch.h"
#import "MRFMacros.h"

@interface MRFImageModel ()
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, readonly) NSArray     *notificationNames;

- (void)subscribeToAplicationNotifications:(NSArray *)notifications;
- (void)unsubcribeFromAplicationNotifications:(NSArray *)notifications;
- (void)dumpWithNotification:(id)notification;

@end

@implementation MRFImageModel

@dynamic notificationNames;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    Class class = url.fileURL ? [MRFFileImageModel class] : [MRFURLImageModel class];
    
    return [[class alloc] initWithURL:url];
}

+ (MRFCache *)sharedCache {
    return [MRFCache cache];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubcribeFromAplicationNotifications:self.notificationNames];
}

- (instancetype)initWithURL:(NSURL *)url {
    MRFCache *imageCache = [MRFImageModel sharedCache];
    id imageModel = [imageCache objectForKey:url];
    
    if (imageModel) {
        return imageModel;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
        [imageCache addObject:self forKey:url];
        [self subscribeToAplicationNotifications:self.notificationNames];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)notificationNames {
    return @[UIApplicationDidReceiveMemoryWarningNotification];
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
#pragma mark Private

- (void)subscribeToAplicationNotifications:(NSArray *)notifications {
    NSNotificationCenter *noticationCenter = [NSNotificationCenter defaultCenter];
    
    for (id notification in notifications) {
        [noticationCenter addObserver:self
                             selector:@selector(dumpWithNotification:)
                                 name:notification
                               object:nil];
    }
}

- (void)unsubcribeFromAplicationNotifications:(NSArray *)notifications {
    NSNotificationCenter *noticationCenter = [NSNotificationCenter defaultCenter];
    
    for (id notification in notifications) {
        [noticationCenter removeObserver:self name:notification object:nil];
    }
    
}

- (void)dumpWithNotification:(id)notification {
    [self dump];
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
