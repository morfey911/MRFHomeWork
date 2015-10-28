//
//  MRFFBUserContext.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBaseContext.h"

@class MRFUserModel;

@interface MRFFBUserContext : MRFBaseContext
@property (nonatomic, readonly) MRFUserModel    *userModel;

- (instancetype)initWithModel:(MRFUserModel *)userModel;

@end
