//
//  MRFArrayModelProtocol.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFArrayChangesModel.h"

@class MRFArrayModel;

@protocol MRFArrayModelProtocol <NSObject>

@optional

- (void)arrayModelWillLoad:(MRFArrayModel *)model;

- (void)arrayModelFailLoaded:(MRFArrayModel *)model;

- (void)arrayModelDidLoad:(MRFArrayModel *)model;

- (void)arrayModel:(MRFArrayModel *)model didChangeWithObject:(MRFArrayChangesModel *)object;

@end
