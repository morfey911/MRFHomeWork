//
//  MRFInfoArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 23.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoArrayModel.h"

#import "MRFInfoModel.h"

#import "MRFMacros.h"

#import "MRFDispatch.h"

#import "NSFileManager+MRFExtensions.h"

static NSString * const kMRFFileName = @"mrfTemp.plist";

@interface MRFInfoArrayModel ()
@property (nonatomic, assign)   NSUInteger  initCount;

- (void)fillWithModelClass:(Class)modelClass count:(NSUInteger)count;

@end

@implementation MRFInfoArrayModel

@dynamic filePath;
@dynamic fileName;
@dynamic fileFolder;
@dynamic cached;

#pragma mark -
#pragma mark Class methods

+ (instancetype)arrayWithModelsCount:(NSUInteger)count {
    return [[self alloc] initWithModelsCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super init];
    
    if (self) {
        self.initCount = count;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (NSString *)fileName {
    return kMRFFileName;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModelClass:(Class)modelClass count:(NSUInteger)count {
    for (NSUInteger index = 0; index < count; index++) {
        [self addModel:[modelClass new]];
    }
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.filePath];
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    if (self.cached) {
        id array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        
        MRFSleep(3)
        
        [self performBlockWithoutNotification:^{
            [self addModels:array];
        }];
    } else {
        [self performBlockWithoutNotification:^{
            [self fillWithModelClass:[MRFInfoModel class] count:self.initCount];
        }];
    }
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
}

@end
