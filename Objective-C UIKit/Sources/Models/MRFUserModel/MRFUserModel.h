//
//  MRFUserModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFModel.h"

typedef NS_ENUM(NSUInteger, MRFUserModelState) {
    MRFModelDidChangeID
};

@class MRFImageModel;
@class MRFArrayModel;

@interface MRFUserModel : MRFModel
@property (nonatomic, copy)     NSString        *userID;
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, copy)     NSString        *email;
@property (nonatomic, strong)   NSURL           *imageURL;
@property (nonatomic, strong)   MRFArrayModel   *friends;

@end
