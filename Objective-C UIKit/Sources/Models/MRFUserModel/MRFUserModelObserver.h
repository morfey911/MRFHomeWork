//
//  MRFUserModelObserver.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFUserModel;

@protocol MRFUserModelObserver <NSObject>

@optional

- (void)userModelDidChangeID:(MRFUserModel *)model;

@end
