//
//  MRFCacheModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 12.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFImageCache.h"

@interface MRFImageCache ()
@property (nonatomic, strong)   NSMapTable  *mapTable;

@end

@implementation MRFImageCache

#pragma mark -
#pragma mark Class Methods

+ (MRFImageCache *)imageCache {
    static MRFImageCache *imageCache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        imageCache = [[self alloc] init];
    });
    
    return imageCache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mapTable = [NSMapTable weakToStrongObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object forKey:(id)key {
    @synchronized(self) {
        [self.mapTable setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized(self) {
        [self.mapTable removeObjectForKey:key];
    }
}

- (id)objectForKey:(id)key {
    @synchronized(self) {
        return [self.mapTable objectForKey:key];
    }
}

@end
