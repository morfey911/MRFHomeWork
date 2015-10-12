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
- (void)subscribeToAplicationNotifications:(NSArray *)notifications;
- (void)unsubcribeFromAplicationNotifications:(NSArray *)notifications;

@end

@implementation MRFInfoArrayModel

@dynamic notifications;
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

- (void)dealloc {
    [self unsubcribeFromAplicationNotifications:self.notifications];
}

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super init];
    
    if (self) {
        self.initCount = count;
        [self subscribeToAplicationNotifications:self.notifications];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)notifications {
    return @[UIApplicationWillResignActiveNotification, UIApplicationWillTerminateNotification];
}

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

- (void)subscribeToAplicationNotifications:(NSArray *)notifications {
    NSNotificationCenter *noticationCenter = [NSNotificationCenter defaultCenter];
    
    for (id notification in notifications) {
        [noticationCenter addObserver:self
                             selector:@selector(save)
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

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.filePath];
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    id block = nil;
    
    if (self.cached) {
        id array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        
        MRFSleep(3)
        
        block = ^{ [self addModels:array]; };
    } else {
        block = ^{ [self fillWithModelClass:[MRFInfoModel class] count:self.initCount]; };
    }
    
    [self performBlockWithoutNotification:block];
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
}

@end
