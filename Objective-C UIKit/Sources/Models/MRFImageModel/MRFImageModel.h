//
//  MRFImageModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 12.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFModel.h"

@interface MRFImageModel : MRFModel
@property (nonatomic, readonly)                     UIImage     *image;
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly)                     NSString    *fileName;
@property (nonatomic, readonly)                     NSString    *fileFolder;
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

+ (instancetype)imageModelWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

@end
