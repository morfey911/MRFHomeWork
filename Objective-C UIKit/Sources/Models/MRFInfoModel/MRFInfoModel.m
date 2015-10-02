//
//  MRFInfoModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoModel.h"

#import "MRFInfoModelProtocol.h"

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
#pragma mark Accessors

//- (UIImage *)image {
//    static UIImage *image = nil;
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSString *path = [[NSBundle mainBundle] pathForResource:kMRFImageName ofType:kMRFImageType];
//        image = [UIImage imageWithContentsOfFile:path];
//    });
//    
//    return image;
//}

#pragma mark -
#pragma mark Public

- (void)load {
    NSUInteger state = self.state;
    
    if (MRFInfoModelDidLoad == state || MRFInfoModelWillLoad == state) {
        return;
    }
    
    self.state = MRFInfoModelWillLoad;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{        
        //todo check for file exists, if no - setState:failLoaded
        NSString *path = [[NSBundle mainBundle] pathForResource:kMRFImageName ofType:kMRFImageType];
        self.image = [UIImage imageWithContentsOfFile:path];
        
        [NSThread sleepForTimeInterval:2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.state = MRFInfoModelDidLoad;
        });
    });
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case MRFInfoModelWillLoad:
            selector = @selector(infoModelWillLoad:);
            break;
            
        case MRFInfoModelDidFailLoad:
            selector = @selector(infoModelDidFailLoad:);
            break;
            
        case MRFInfoModelDidLoad:
            selector = @selector(infoModelDidLoad:);
            break;
            
        default:
            break;
    }
    
    return selector;
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
