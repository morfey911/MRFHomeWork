//
//  MRFArrayModelProtocol.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFArrayModel;
@class MRFArrayChangesModel;

@protocol MRFArrayModelProtocol <NSObject>

@optional

- (void)arrayModelWillLoad:(MRFArrayModel *)model;

- (void)arrayModelDidFailLoading:(MRFArrayModel *)model;

- (void)arrayModelDidLoad:(MRFArrayModel *)model;

- (void)arrayModel:(MRFArrayModel *)model didChangeWithObject:(MRFArrayChangesModel *)object;

@end
