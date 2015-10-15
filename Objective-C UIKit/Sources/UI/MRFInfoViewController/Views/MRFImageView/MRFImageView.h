//
//  MRFImageView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 14.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFModelProtocol.h"

@class MRFImageModel;

@interface MRFImageView : UIView <MRFModelProtocol>
@property (nonatomic, strong)   IBOutlet    UIImageView     *imageView;

@property (nonatomic, strong)   MRFImageModel   *imageModel;

- (void)fillWithModel:(MRFImageModel *)model;

@end
