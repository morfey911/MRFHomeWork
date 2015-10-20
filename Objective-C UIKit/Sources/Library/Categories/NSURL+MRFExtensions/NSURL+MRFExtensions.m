//
//  NSURL+MRFExtensions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "NSURL+MRFExtensions.h"

#import "MRFFileImageModel.h"
#import "MRFURLImageModel.h"

@implementation NSURL (MRFExtensions)

+ (id)imageModelForURL:(NSURL *)url {
    Class class = [@"file" isEqual:url.scheme] ? [MRFFileImageModel class] : [MRFURLImageModel class];
    
    return [[class alloc] initWithURL:url];
}

@end
