//
//  MRFModelProtocol.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 06.10.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFModel;

@protocol MRFModelProtocol <NSObject>

@optional

- (void)modelWillLoad:(MRFModel *)model;

- (void)modelDidFailLoading:(MRFModel *)model;

- (void)modelDidLoad:(MRFModel *)model;

- (void)model:(MRFModel *)model didChangeWithObject:(id)object;

@end
