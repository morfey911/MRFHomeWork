//
//  MRFFileImageModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFImageModel.h"

@interface MRFFileImageModel : MRFImageModel
@property (nonatomic, readonly, getter=isCached)    BOOL    cached;

@end
