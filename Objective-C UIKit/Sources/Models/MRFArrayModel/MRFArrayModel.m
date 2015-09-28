//
//  MRFArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"

#import "MRFArrayChangesModel.h"

#import "NSMutableArray+MRFExtension.h"

static NSString * const kMRFFilePath = @"/tmp/mrfTemp.plist";

@interface MRFArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation MRFArrayModel

@dynamic array;

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

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    [self.mutableArray addObject:model];
    
    [self setState:MRFArrayModelDidChange
        withObject:[MRFArrayChangesModel appendModelWithIndex:(self.count - 1)]];
}

- (void)removeModel:(id)model {
    NSUInteger index = [self.mutableArray indexOfObject:model];
    
    [self.mutableArray removeObject:model];
    
    [self setState:MRFArrayModelDidChange withObject:[MRFArrayChangesModel deleteModelWithIndex:index]];
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

- (id)modelAtIndex:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self modelAtIndex:idx];
}


- (void)loadArrayFromFile {    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        sleep(4);
        
        MRFArrayModel *arrayModel = [NSKeyedUnarchiver unarchiveObjectWithFile:kMRFFilePath];
        
        if (arrayModel) {
            self.mutableArray = arrayModel.mutableArray;
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.state = MRFArrayModelLoaded;
        });
    });
}

- (void)saveArrayToFile {
    [NSKeyedArchiver archiveRootObject:self toFile:kMRFFilePath];
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
            selector = @selector (arrayModel:didChangeWithObject:);
            break;
            
        default:
            break;
    }
    
    return selector;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.mutableArray forKey:@"array"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.mutableArray = [aDecoder decodeObjectForKey:@"array"];
    }
    
    return self;
}

@end
