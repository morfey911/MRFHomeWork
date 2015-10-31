//
//  MRFFBGraphRequestContext.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBaseContext.h"

@class MRFModel;

@interface MRFFBGraphRequestContext : MRFBaseContext
@property (nonatomic, readonly) MRFModel    *model;

- (instancetype)initWithModel:(MRFModel *)model;

//method for override
- (NSString *)graphPath;

//method for override
- (NSDictionary *)graphPathParameters;

//method for override
- (void)parseResult:(id)result error:(NSError *)error;

@end
