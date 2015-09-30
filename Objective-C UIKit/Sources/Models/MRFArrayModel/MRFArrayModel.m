//
//  MRFArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"

#import "MRFArrayChangesModel.h"

#import "MRFArrayModelProtocol.h"

#import "NSMutableArray+MRFExtension.h"
#import "NSFileManager+MRFExtensions.h"

static NSString * const kMRFFileName = @"mrfTemp.plist";
static NSString * const kMRFMutableArray = @"mutableArray";

@interface MRFArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation MRFArrayModel

@dynamic array;
@dynamic filePath;
@dynamic fileName;
@dynamic fileFolder;
@dynamic cached;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
    return [self.mutableArray copy];
}

- (NSUInteger)count {
    return self.mutableArray.count;
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (NSString *)fileName {
    return kMRFFileName;
}

- (NSString *)fileFolder {
    return [NSFileManager pathForUserDocument];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    [self.mutableArray addObject:model];
    
    [self setState:MRFArrayModelDidChange
        withObject:[MRFArrayChangesModel appendModelWithIndex:(self.count - 1)]];
}

- (void)removeModel:(id)model {
    [self.mutableArray removeObject:model];
    
    [self setState:MRFArrayModelDidChange
        withObject:[MRFArrayChangesModel deleteModelWithIndex:[self indexOfModel:model]]];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    [self.mutableArray insertObject:model atIndex:index];
    
    [self setState:MRFArrayModelDidChange withObject:[MRFArrayChangesModel appendModelWithIndex:index]];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
    
    [self setState:MRFArrayModelDidChange withObject:[MRFArrayChangesModel deleteModelWithIndex:index]];
}

- (void)moveModelFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2 {
    [self.mutableArray moveObjectFromIndex:index1 toIndex:index2];
    
    [self setState:MRFArrayModelDidChange
        withObject:[MRFArrayChangesModel moveModelFromIndex:index1 toIndex:index2]];
}

- (NSUInteger)indexOfModel:(id)model {
    return [self.mutableArray indexOfObject:model];
}

- (id)modelAtIndex:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self modelAtIndex:idx];
}


- (void)load {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        if (self.cached) {
            sleep(2);
            
            MRFArrayModel *arrayModel = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
            
            if (arrayModel) {
                self.mutableArray = arrayModel.mutableArray;
            }
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.state = MRFArrayModelLoaded;
        });
    });
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.filePath];
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case MRFArrayModelLoaded:
            selector = @selector(arrayModelDidLoad:);
            break;
            
        case MRFArrayModelDidChange:
            selector = @selector(arrayModel:didChangeWithObject:);
            break;
            
        default:
            break;
    }
    
    return selector;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.mutableArray forKey:kMRFMutableArray];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.mutableArray = [aDecoder decodeObjectForKey:kMRFMutableArray];
    }
    
    return self;
}

@end
