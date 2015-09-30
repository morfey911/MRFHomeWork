//
//  MRFInfoModelProtocol.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 30.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFInfoModel;

@protocol MRFInfoModelProtocol <NSObject>

@optional

- (void)infoModelWillLoad:(MRFInfoModel *)model;

- (void)infoModelFailLoaded:(MRFInfoModel *)model;

- (void)infoModelDidLoad:(MRFInfoModel *)model;

@end
