//
//  MRFPositionModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFArrayChangesModel.h"

@interface MRFPositionModel : MRFArrayChangesModel
@property (nonatomic, strong)   NSIndexPath *position;

+ (instancetype)positionModelWithPosition:(NSIndexPath *)position;

- (instancetype)initWithPosition:(NSIndexPath *)position;

- (NSIndexPath *)getSourcePosition;

@end
