//
//  MRFInfoModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoModel.h"

#import "MRFDispatch.h"

#import "NSString+MRFExtensions.h"

static const NSUInteger kMRFStringLength    = 10;
static NSString * const kMRFImageName       = @"Kappa";
static NSString * const kMRFImageType       = @"png";
static NSString * const kMRFString          = @"string";

@interface MRFInfoModel ()
@property (nonatomic, strong)   NSString *string;
@property (nonatomic, strong)   UIImage  *image;

@end

@implementation MRFInfoModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.string = [NSString randomStringWithLength:kMRFStringLength];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    //todo check for file exists, if no - setState:failLoaded
    NSString *path = [[NSBundle mainBundle] pathForResource:kMRFImageName ofType:kMRFImageType];
    self.image = [UIImage imageWithContentsOfFile:path];
    
//    [NSThread sleepForTimeInterval:2];
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.string forKey:kMRFString];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.string = [aDecoder decodeObjectForKey:kMRFString];
    }
    
    return self;
}

@end
