//
//  UINib+MRFExtentions.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (MRFExtentions)

+ (UINib *)nibWithClass:(Class)class;
+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)class;
- (id)objectWithClass:(Class)class;

- (NSArray *)instantiate;
- (NSArray *)instantiateWithOwner:(id)ownerOrNil;

@end
