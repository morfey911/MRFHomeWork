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
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageModelWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)save;
- (void)dump;

//you must call a complition in subclasses, when loading was finished
- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion;
- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error;
- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error;

@end
