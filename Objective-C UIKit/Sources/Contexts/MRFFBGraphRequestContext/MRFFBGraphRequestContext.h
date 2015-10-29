//
//  MRFFBGraphRequestContext.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFBaseContext.h"

@class MRFUserModel;

@interface MRFFBGraphRequestContext : MRFBaseContext
@property (nonatomic, readonly) MRFUserModel    *model;

- (instancetype)initWithModel:(MRFUserModel *)model;

//method for override
- (NSString *)graphPath;

//method for override
- (NSDictionary *)graphPathParameters;

//method for override
- (void)parseWithResult:(id)result error:(NSError *)error;

@end
