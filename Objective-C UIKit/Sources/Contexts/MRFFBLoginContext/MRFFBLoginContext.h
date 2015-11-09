//
//  MRFFBLoginContext.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBaseContext.h"

@class MRFUser;

@interface MRFFBLoginContext : MRFBaseContext
@property (nonatomic, readonly) MRFUser  *model;

- (instancetype)initWithModel:(MRFUser *)model;

@end
