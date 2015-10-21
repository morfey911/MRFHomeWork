//
//  MRFInfoModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoModel.h"

#import "MRFImageModel.h"

#import "NSString+MRFExtensions.h"

static const NSUInteger kMRFStringLength    = 10;
static NSString * const kMRFString          = @"kMRFString";
static NSString * const kMRFImageURLString  = @"http://stickerboom.ru/files/2013/04/13/1012xe2cc-300x220.png";

@interface MRFInfoModel ()
@property (nonatomic, strong)   NSString        *string;
@property (nonatomic, strong)   MRFImageModel   *imageModel;

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
#pragma mark Accessors

- (MRFImageModel *)imageModel {
    NSURL *url = [NSURL URLWithString:kMRFImageURLString];
    return [MRFImageModel imageModelWithURL:url];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.string forKey:kMRFString];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self) {
        self.string = [aDecoder decodeObjectForKey:kMRFString];
    }
    
    return self;
}

@end
