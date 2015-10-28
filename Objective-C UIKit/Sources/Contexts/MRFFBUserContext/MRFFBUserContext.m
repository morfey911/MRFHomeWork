//
//  MRFFBUserContext.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFBUserContext.h"

@interface MRFFBUserContext ()
@property (nonatomic, strong)   MRFUserModel    *userModel;

@end

@implementation MRFFBUserContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(MRFUserModel *)userModel {
    self = [super init];
    if (self) {
        self.userModel = userModel;
    }
    
    return self;
}

@end
