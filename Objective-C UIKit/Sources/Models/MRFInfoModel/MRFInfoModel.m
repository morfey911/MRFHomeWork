//
//  MRFInfoModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoModel.h"

#import "NSString+MRFExtensions.h"

static const NSUInteger kMRFStringLength    = 10;
static NSString * const kMRFImageName       = @"Kappa";
static NSString * const kMRFImageType       = @"png";

@interface MRFInfoModel ()
@property (nonatomic, strong)   NSString *string;

@end

@implementation MRFInfoModel

@dynamic image;

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
#pragma mark Accessors

- (UIImage *)image {
    static UIImage *image = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:kMRFImageName ofType:kMRFImageType];
        image = [UIImage imageWithContentsOfFile:path];
    });
    
    return image;
}

#pragma mark -
#pragma mark NSCoding

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.string forKey:@"string"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.string = [aDecoder decodeObjectForKey:@"string"];
    }
    
    return self;
}

@end
