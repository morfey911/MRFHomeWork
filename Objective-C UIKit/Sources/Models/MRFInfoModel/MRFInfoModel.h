//
//  MRFInfoModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFModel.h"

@interface MRFInfoModel : MRFModel <NSCoding>
@property (nonatomic, readonly)     NSString    *string;
@property (nonatomic, readonly)     UIImage     *image;

@end
